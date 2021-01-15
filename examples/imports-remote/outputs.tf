output "map_configs" {
  value       = module.yaml_config.map_configs
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = module.yaml_config.list_configs
  description = "Terraform lists from YAML configurations"
}

output "all_imports" {
  value       = module.yaml_config.all_imports
  description = "List of all imported YAML configurations"
}
