output "map_configs" {
  value       = module.yaml_config.map_configs
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = module.yaml_config.list_configs
  description = "Terraform lists from YAML configurations"
}

output "yaml_config_1_imports" {
  value       = module.yaml_config.yaml_config_1_imports
  description = "First level of imports from YAML configurations"
}

output "yaml_config_2_imports" {
  value       = module.yaml_config.yaml_config_2_imports
  description = "Second level of imports from YAML configurations"
}

output "yaml_config_3_imports" {
  value       = module.yaml_config.yaml_config_3_imports
  description = "Third level of imports from YAML configurations"
}

output "yaml_config_4_imports" {
  value       = module.yaml_config.yaml_config_4_imports
  description = "Fourth level of imports from YAML configurations"
}
