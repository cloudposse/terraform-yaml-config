output "map_config" {
  value       = module.yaml_config.map_config
  description = "Terraform map resources built from YAML configurations"
}

output "list_config" {
  value       = module.yaml_config.list_config
  description = "Terraform list resources built from YAML configurations"
}
