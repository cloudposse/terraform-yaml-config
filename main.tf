locals {
  # Build a map from YAML configuration
  map_config = merge({},
    [
      for file in(var.map_config_path != "" && var.map_config_path != null ? fileset(var.map_config_path, var.pattern) : []) : {
        for k, v in yamldecode(file(format("%s/%s", var.map_config_path, file))) : k => v
      }
    ]
  ...)

  # Build a list from YAML configuration
  list_config = flatten(
    [
      for file in(var.list_config_path != "" && var.list_config_path != null ? fileset(var.list_config_path, var.pattern) : []) : [
        for k, v in yamldecode(file(format("%s/%s", var.list_config_path, file))) : v
      ]
    ]
  )
}
