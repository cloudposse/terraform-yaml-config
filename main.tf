module "yaml-config" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = var.map_config_paths
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}
