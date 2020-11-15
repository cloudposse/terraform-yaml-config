module "yaml_config" {
  source = "../../"

  map_yaml_config_local_base_path = path.cwd
  map_yaml_config_paths           = var.map_yaml_config_paths

  list_yaml_config_local_base_path = path.cwd
  list_yaml_config_paths           = var.list_yaml_config_paths

  parameters = var.parameters

  context = module.this.context
}
