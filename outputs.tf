output "map_config" {
  value       = local.map_config
  description = "Terraform map resources built from YAML configurations"
}

output "list_config" {
  value       = local.list_config
  description = "Terraform list resources built from YAML configurations"
}
