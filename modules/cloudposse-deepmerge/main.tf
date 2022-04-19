locals {
  # Local YAML paths with configs of type map
  local_map_config_paths = module.this.enabled ? [
    for path in var.map_config_paths : path if replace(path, var.remote_config_selector, "") == path
  ] : []

  # Remote YAML paths with configs of type map
  remote_map_config_paths = module.this.enabled ? [
    for path in var.map_config_paths : path if replace(path, var.remote_config_selector, "") != path
  ] : []

  # All remote config paths
  all_remote_config_paths_map = module.this.enabled ? {
    for c in local.remote_map_config_paths : base64encode(c) => c
  } : {}

  local_util_deep_merge_list = flatten([
    for path in local.local_map_config_paths : [
      for f in fileset(var.map_config_local_base_path, path) :
      templatefile(format("%s/%s", var.map_config_local_base_path, f), var.parameters)
    ]
  ])

  # Terraform maps from remote YAML configuration templates
  remote_util_deep_merge_list = flatten([
    for path in local.remote_map_config_paths :
    data.template_file.remote_config[base64encode(path)].rendered
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

data "utils_deep_merge_yaml" "all_map_configs" {
  input          = concat(local.remote_util_deep_merge_list, local.local_util_deep_merge_list)
  deep_copy_list = var.deep_copy_list
  append_list    = var.append_list
}
