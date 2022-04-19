data "utils_deep_merge_yaml" "all_map_configs" {
  input          = var.maps
  deep_copy_list = var.deep_copy_list
  append_list    = var.append_list
}
