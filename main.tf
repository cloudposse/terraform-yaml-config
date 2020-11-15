locals {
  # Maps from local YAML configurations
  local_map_configs = merge(
    flatten(
      [
        for config in var.map_yaml_configs : [
          for f in fileset(var.map_yaml_config_path, config) : {
            for k, v in yamldecode(file(format("%s/%s", var.map_yaml_config_path, f))) : k => v
          }
        ] if replace(config, "://", "") == config
      ]
    )
  ...)

  # Lists from local YAML configurations
  local_list_configs = flatten(
    [
      for config in var.list_yaml_configs : [
        for f in fileset(var.list_yaml_config_path, config) : [
          for k, v in yamldecode(file(format("%s/%s", var.list_yaml_config_path, f))) : v
        ]
      ] if replace(config, "://", "") == config
    ]
  )

  map_configs  = merge({}, local.local_map_configs)
  list_configs = concat([], local.local_list_configs)
}
