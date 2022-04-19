output "map_configs" {
  value       = module.deep_merge.merged
  description = "Terraform maps from YAML configurations"
}
