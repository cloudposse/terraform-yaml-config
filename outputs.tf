output "map_configs" {
  value       = module.maps_deepmerge.merged
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = module.yaml_config_1.list_configs
  description = "Terraform lists from YAML configurations"
}
