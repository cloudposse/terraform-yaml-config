variable "map_yaml_config_path" {
  type        = string
  description = "Path to YAML configuration files of map type"
  default     = "."
}

variable "map_yaml_configs" {
  type        = list(string)
  description = "YAML configuration files of map type"
  default     = []
}

variable "list_yaml_config_path" {
  type        = string
  description = "Path to YAML configuration files of list type"
  default     = "."
}

variable "list_yaml_configs" {
  type        = list(string)
  description = "YAML configuration files of list type"
  default     = []
}
