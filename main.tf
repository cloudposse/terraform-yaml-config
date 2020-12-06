module "yaml_config_1" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = var.map_config_paths
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}

module "yaml_config_2" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = module.yaml_config_1.map_imports
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}

module "yaml_config_3" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = module.yaml_config_2.map_imports
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}

module "yaml_config_4" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = module.yaml_config_3.map_imports
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}

module "yaml_config_5" {
  source = "./modules/yaml-config"

  map_config_local_base_path  = var.map_config_local_base_path
  map_config_paths            = module.yaml_config_4.map_imports
  list_config_local_base_path = var.list_config_local_base_path
  list_config_paths           = var.list_config_paths
  parameters                  = var.parameters
  remote_config_selector      = var.remote_config_selector

  context = module.this.context
}

module "maps_deepmerge" {
  source = "./modules/deepmerge"

  maps = [
    module.yaml_config_5.map_configs,
    module.yaml_config_4.map_configs,
    module.yaml_config_3.map_configs,
    module.yaml_config_2.map_configs,
    module.yaml_config_1.map_configs
  ]
}
