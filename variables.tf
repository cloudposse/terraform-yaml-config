variable "map_config_path" {
  type        = string
  description = "Path to map resources YAML configuration files"
  default     = ""
}

variable "list_config_path" {
  type        = string
  description = "Path to list resources YAML configuration files"
  default     = ""
}

variable "pattern" {
  type        = string
  description = "YAML configuration files pattern"
  default     = "*.yaml"
}
