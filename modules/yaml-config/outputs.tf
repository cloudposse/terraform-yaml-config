output "map_configs" {
#  value       = yamldecode(module.deep_merge.merged)
  value       = module.deep_merge.merged
  description = "Terraform maps from YAML configurations"
}

output "list_configs" {
  value       = local.all_list_configs
  description = "Terraform lists from YAML configurations"
}

output "local_map_imports" {
  value       = local.local_map_imports
  description = "Imports from local map configs"
}

output "remote_map_imports" {
  value       = local.remote_map_imports
  description = "Imports from remote map configs"
}

output "all_map_imports" {
  value       = local.all_map_imports
  description = "Combined imports from local and remote map configs"
}
