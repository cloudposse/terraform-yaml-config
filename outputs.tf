output "map_configs" {
  value       = local.all_map_configs
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = local.all_list_configs
  description = "Terraform lists from YAML configurations"
}
