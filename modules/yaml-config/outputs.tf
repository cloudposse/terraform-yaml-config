output "map_configs" {
  value       = local.all_map_configs
  description = "Terraform maps from YAML configurations"
}

output "map_imports" {
  value       = local.map_imports
  description = "List of imports from Terraform map configs"
}

output "list_configs" {
  value       = local.all_list_configs
  description = "Terraform lists from YAML configurations"
}
