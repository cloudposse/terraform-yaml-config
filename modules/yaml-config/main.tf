locals {
  # Local YAML paths with configs of type map
  local_map_config_paths = module.this.enabled ? [
    for c in var.map_config_paths : c if replace(c, var.remote_config_selector, "") == c
  ] : []

  # Terraform maps from local YAML configuration templates
  local_map_configs = merge(
    flatten(
      [
        for c in local.local_map_config_paths : [
          for f in fileset(var.map_config_local_base_path, c) : {
            for k, v in yamldecode(templatefile(format("%s/%s", var.map_config_local_base_path, f), var.parameters)) : k => v
          }
        ]
      ]
    )
  ...)

  # Remote YAML paths with configs of type map
  remote_map_config_paths = module.this.enabled ? [
    for c in var.map_config_paths : c if replace(c, var.remote_config_selector, "") != c
  ] : []

  # Terraform maps from remote YAML configuration templates
  remote_map_configs = merge(
    [
      for c in local.remote_map_config_paths : {
        for k, v in yamldecode(data.template_file.remote_config[base64encode(c)].rendered) : k => v
      }
    ]
  ...)

  # Local YAML paths with configs of type list
  local_list_config_paths = module.this.enabled ? [
    for c in var.list_config_paths : c if replace(c, var.remote_config_selector, "") == c
  ] : []

  # Terraform lists from local YAML configuration templates
  local_list_configs = flatten(
    [
      for c in local.local_list_config_paths : [
        for f in fileset(var.list_config_local_base_path, c) : [
          for k, v in yamldecode(templatefile(format("%s/%s", var.list_config_local_base_path, f), var.parameters)) : v
        ]
      ]
    ]
  )

  # Remote YAML paths with configs of type list
  remote_list_config_paths = module.this.enabled ? [
    for c in var.list_config_paths : c if replace(c, var.remote_config_selector, "") != c
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

  # Final map configs
  all_map_configs = merge({}, local.local_map_configs, local.remote_map_configs)

  # Final list configs
  all_list_configs = concat([], local.local_list_configs, local.remote_list_configs)

  # Map Imports
  map_imports = flatten([
    for imports in lookup(local.all_map_configs, "import", []) : [
      for import in imports : format("%s.yaml", import)
    ]
  ])
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
