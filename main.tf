locals {
  # String to detect local vs. remote config paths
  remote_config_selector = "://"

  # Local YAML paths with configs of type map
  local_map_yaml_config_paths = [
    for c in var.map_yaml_config_paths : c if replace(c, local.remote_config_selector, "") == c
  ]

  # Remote YAML paths with configs of type map
  remote_map_yaml_config_paths = [
    for c in var.map_yaml_config_paths : c if replace(c, local.remote_config_selector, "") != c
  ]

  # Local YAML paths with configs of type list
  local_list_yaml_config_paths = [
    for c in var.list_yaml_config_paths : c if replace(c, local.remote_config_selector, "") == c
  ]

  # Remote YAML paths with configs of type list
  remote_list_yaml_config_paths = [
    for c in var.list_yaml_config_paths : c if replace(c, local.remote_config_selector, "") != c
  ]

  # All remote config paths
  all_remote_config_paths_map = {
    for c in concat(local.remote_map_yaml_config_paths, local.remote_list_yaml_config_paths) : base64encode(c) => c
  }

  # Terraform maps from local YAML configurations
  local_map_configs = merge(
    flatten(
      [
        for c in local.local_map_yaml_config_paths : [
          for f in fileset(var.map_yaml_config_local_base_path, c) : {
            for k, v in yamldecode(file(format("%s/%s", var.map_yaml_config_local_base_path, f))) : k => v
          }
        ]
      ]
    )
  ...)

  # Terraform maps from remote YAML configurations
  remote_map_configs = merge(
    [
      for c in local.remote_map_yaml_config_paths : {
        for k, v in yamldecode(data.http.this[base64encode(c)].body) : k => v
      }
    ]
  ...)

  # Terraform lists from local YAML configurations
  local_list_configs = flatten(
    [
      for c in local.local_list_yaml_config_paths : [
        for f in fileset(var.list_yaml_config_local_base_path, c) : [
          for k, v in yamldecode(file(format("%s/%s", var.list_yaml_config_local_base_path, f))) : v
        ]
      ]
    ]
  )

  # Terraform lists from remote YAML configurations
  remote_list_configs = flatten(
    [
      for c in local.remote_list_yaml_config_paths : [
        for k, v in yamldecode(data.http.this[base64encode(c)].body) : v
      ]
    ]
  )

  # All map configs
  map_configs = merge({}, local.local_map_configs, local.remote_map_configs)

  # All list configs
  list_configs = concat([], local.local_list_configs, local.remote_list_configs)
}

# Download all remote configs
data "http" "this" {
  for_each = local.all_remote_config_paths_map
  url      = each.value
}
