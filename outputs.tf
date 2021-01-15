output "map_configs" {
  value       = module.maps_deepmerge.merged
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = module.yaml_config_1.list_configs
  description = "Terraform lists from YAML configurations"
}

output "all_imports_list" {
  value       = local.all_imports_list
  description = "List of all imported YAML configurations"
}

output "all_imports_map" {
  value       = local.all_imports_map
  description = "Map of all imported YAML configurations"
}
