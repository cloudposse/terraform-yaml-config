output "map_configs" {
  value       = data.utils_deep_merge_yaml.all_map_configs.output
  description = "Terraform maps from YAML configurations"
}
