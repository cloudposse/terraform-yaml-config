variable "map_config_local_base_path" {
  type        = string
  description = "Base path to local YAML configuration files of map type"
  default     = ""
}

variable "map_config_remote_base_path" {
  type        = string
  description = "Base path to remote YAML configuration files of map type"
  default     = ""
}

variable "map_config_paths" {
  type        = list(string)
  description = "Paths to YAML configuration files of map type"
  default     = []
}

variable "list_config_local_base_path" {
  type        = string
  description = "Base path to local YAML configuration files of list type"
  default     = ""
}

variable "list_config_remote_base_path" {
  type        = string
  description = "Base path to remote YAML configuration files of list type"
  default     = ""
}

variable "list_config_paths" {
  type        = list(string)
  description = "Paths to YAML configuration files of list type"
  default     = []
}

variable "parameters" {
  type        = map(string)
  description = "Map of parameters for interpolation within the YAML config templates"
  default     = {}
}

variable "remote_config_selector" {
  type        = string
  description = "String to detect local vs. remote config paths"
  default     = "://"
}

variable "append_list_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable appending lists instead of overwriting them."
  default     = false
}

variable "deep_copy_list_enabled" {
  type        = bool
  description = "A boolean flag to enable/disable merging of list elements one by one."
  default     = false
}
