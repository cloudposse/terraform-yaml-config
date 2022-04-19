output "merged" {
  description = "The merged map"
  value       = data.utils_deep_merge_yaml.all_map_configs.output
}
