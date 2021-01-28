output "map_configs" {
  value       = yamldecode(data.utils_deep_merge_yaml.maps_deepmerge.output)
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
