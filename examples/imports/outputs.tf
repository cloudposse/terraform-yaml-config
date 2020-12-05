output "map_configs" {
  value       = module.yaml_config.map_configs
  description = "Terraform maps from YAML configurations"
}

output "map_imports" {
  value       = module.yaml_config.map_imports
  description = "List of imports from Terraform map configs"
}

output "list_configs" {
  value       = module.yaml_config.list_configs
  description = "Terraform lists from YAML configurations"
}
