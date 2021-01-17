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

variable "map_configs" {
  type        = any
  description = "List of existing configurations of map type. Deep-merging of the existing map configs takes precedence over the map configs loaded from YAML files"
  default     = []
}
