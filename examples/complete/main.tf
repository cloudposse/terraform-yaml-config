module "yaml_config" {
  source = "../../"

  map_config_local_base_path = path.cwd
  map_config_paths           = var.map_config_paths

  list_config_local_base_path = path.cwd
  list_config_paths           = var.list_config_paths

  parameters = var.parameters

  context = module.this.context
}
