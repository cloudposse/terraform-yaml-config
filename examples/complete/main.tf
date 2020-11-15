module "yaml_config" {
  source = "../../"

  map_yaml_config_path = path.cwd

  map_yaml_configs = [
    "config/opsgenie-resources/*.yaml"
  ]

  list_yaml_config_path = path.cwd

  list_yaml_configs = [
    "config/service-control-policies/*.yaml"
  ]

  context = module.this.context
}
