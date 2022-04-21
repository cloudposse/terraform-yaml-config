data "utils_deep_merge_yaml" "all_map_configs" {
  input          = [for k, v in var.maps : yamlencode(v)]
  deep_copy_list = var.deep_copy_list_enabled
  append_list    = var.append_list_enabled
}
