variable "map_yaml_config_local_base_path" {
  type        = string
  description = "Base path to local YAML configuration files of map type"
  default     = "."
}

variable "map_yaml_config_paths" {
  type        = list(string)
  description = "Paths to YAML configuration files of map type"
  default     = []
}

variable "list_yaml_config_local_base_path" {
  type        = string
  description = "Base path to local YAML configuration files of list type"
  default     = "."
}

variable "list_yaml_config_paths" {
  type        = list(string)
  description = "Paths to YAML configuration files of list type"
  default     = []
}

variable "parameters" {
  type        = map(string)
  description = "Map of parameters for interpolation within the YAML config templates"
  default     = {}
}
