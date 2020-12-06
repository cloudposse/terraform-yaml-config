output "map_configs" {
  value       = module.maps_deepmerge.merged
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = module.yaml_config_1.list_configs
  description = "Terraform lists from YAML configurations"
}

output "yaml_config_1_imports" {
  value       = local.yaml_config_1_imports
  description = "First level of imports from YAML configurations"
}

output "yaml_config_2_imports" {
  value       = local.yaml_config_2_imports
  description = "Second level of imports from YAML configurations"
}

output "yaml_config_3_imports" {
  value       = local.yaml_config_3_imports
  description = "Third level of imports from YAML configurations"
}

output "yaml_config_4_imports" {
  value       = local.yaml_config_4_imports
  description = "Fourth level of imports from YAML configurations"
}
