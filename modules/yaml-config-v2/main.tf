locals {
  # Local YAML paths with configs of type map
  local_map_config_paths = module.this.enabled ? [
    for path in var.map_config_paths : path if replace(path, var.remote_config_selector, "") == path
  ] : []

  # Terraform maps from local YAML configuration templates
  local_map_configs = flatten(
    [
      for path in local.local_map_config_paths : [
        for f in fileset(var.map_config_local_base_path, path) : {
          for k, v in yamldecode(templatefile(format("%s/%s", var.map_config_local_base_path, f), var.parameters)) : k => v
        }
      ]
    ]
  )

  # Remote YAML paths with configs of type map
  remote_map_config_paths = module.this.enabled ? [
    for path in var.map_config_paths : path if replace(path, var.remote_config_selector, "") != path
  ] : []

  # Terraform maps from remote YAML configuration templates
  remote_map_configs = flatten(
    [
      for path in local.remote_map_config_paths : {
        for k, v in yamldecode(data.template_file.remote_config[base64encode(path)].rendered) : k => v
      }
    ]
  )

  # Local YAML paths with configs of type list
  local_list_config_paths = module.this.enabled ? [
    for path in var.list_config_paths : path if replace(path, var.remote_config_selector, "") == path
  ] : []

  # Terraform lists from local YAML configuration templates
  local_list_configs = flatten(
    [
      for path in local.local_list_config_paths : [
        for f in fileset(var.list_config_local_base_path, path) : [
          for k, v in yamldecode(templatefile(format("%s/%s", var.list_config_local_base_path, f), var.parameters)) : v
        ]
      ]
    ]
  )

  # Remote YAML paths with configs of type list
  remote_list_config_paths = module.this.enabled ? [
    for path in var.list_config_paths : path if replace(path, var.remote_config_selector, "") != path
  ] : []

  # Terraform lists from remote YAML configuration templates
  remote_list_configs = flatten(
    [
      for c in local.remote_list_config_paths : [
        for k, v in yamldecode(data.template_file.remote_config[base64encode(c)].rendered) : v
      ]
    ]
  )

  # All remote config paths
  all_remote_config_paths_map = module.this.enabled ? {
    for c in concat(local.remote_map_config_paths, local.remote_list_config_paths) : base64encode(c) => c
  } : {}
}

module "all_map_configs" {
  source = "../deepmerge"
  maps   = concat([{}], local.remote_map_configs, local.local_map_configs)
}

# Download all remote configs
data "http" "remote_config" {
  for_each = module.this.enabled ? local.all_remote_config_paths_map : {}
  url      = each.value
}

# Render all remote configs as templates using the supplied map of template variables
data "template_file" "remote_config" {
  for_each = module.this.enabled ? data.http.remote_config : {}
  template = try(each.value.body, "")
  vars     = var.parameters
}

data "utils_deep_merge_yaml" "all_map_configs" {
  input = [local.remote_map_configs, local.local_map_configs]
  deep_copy_list = var.deep_copy_list
  append_list = var.append_list
}

locals {
  # Final list configs
  all_list_configs = concat([], local.local_list_configs, local.remote_list_configs)

  # Imports from local map configs
  local_map_imports = [
    for import in lookup(merge({}, local.local_map_configs...), "import", []) : format("%s.yaml", import)
  ]

  # Imports from remote map configs
  remote_map_imports = [
    for import in lookup(merge({}, local.remote_map_configs...), "import", []) : format("%s/%s.yaml", var.map_config_remote_base_path, import)
  ]

  # Combined imports from local and remote map configs
  all_map_imports = concat(local.remote_map_imports, local.local_map_imports)
}
