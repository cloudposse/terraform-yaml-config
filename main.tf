locals {
  remote_config_selector = "://"

  local_map_yaml_config_paths = [
    for c in var.map_yaml_configs : c if replace(c, local.remote_config_selector, "") == c
  ]

  remote_map_yaml_config_paths = [
    for c in var.map_yaml_configs : c if replace(c, local.remote_config_selector, "") != c
  ]

  local_list_yaml_config_paths = [
    for c in var.list_yaml_configs : c if replace(c, local.remote_config_selector, "") == c
  ]

  remote_list_yaml_config_paths = [
    for c in var.list_yaml_configs : c if replace(c, local.remote_config_selector, "") != c
  ]

  all_remote_config_paths_map = {
    for c in concat(local.remote_map_yaml_config_paths, local.remote_list_yaml_config_paths) : base64encode(c) => c
  }

  # Maps from local YAML configurations
  local_map_configs = merge(
    flatten(
      [
        for c in local.local_map_yaml_config_paths : [
          for f in fileset(var.map_yaml_config_path, c) : {
            for k, v in yamldecode(file(format("%s/%s", var.map_yaml_config_path, f))) : k => v
          }
        ]
      ]
    )
  ...)

  # Maps from remote YAML configurations
  remote_map_configs = merge(
    [
      for c in local.remote_map_yaml_config_paths : {
        for k, v in yamldecode(data.http.this[base64encode(c)].body) : k => v
      }
    ]
  ...)

  # Lists from local YAML configurations
  local_list_configs = flatten(
    [
      for c in local.local_list_yaml_config_paths : [
        for f in fileset(var.list_yaml_config_path, c) : [
          for k, v in yamldecode(file(format("%s/%s", var.list_yaml_config_path, f))) : v
        ]
      ]
    ]
  )

  # Lists from remote YAML configurations
  remote_list_configs = flatten(
    [
      for c in local.remote_list_yaml_config_paths : [
        for k, v in yamldecode(data.http.this[base64encode(c)].body) : v
      ]
    ]
  )

  map_configs  = merge({}, local.local_map_configs, local.remote_map_configs)
  list_configs = concat([], local.local_list_configs, local.remote_list_configs)
}

data "http" "this" {
  for_each = local.all_remote_config_paths_map
  url      = each.value
}
