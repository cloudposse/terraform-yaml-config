variable "maps" {
  description = "A list of maps to merge. Maps should be ordered in increasing precedence, i.e. values in a map later in the list will overwrite values in a map earlier in the list."
  type        = any
  validation {
    condition     = try(tonumber(var.maps), tobool(var.maps), tostring(var.maps), tomap(var.maps), null) == null
    error_message = "The `maps` variable must be a list of maps and/or objects. The provided value is not a list."
  }
#  validation {
#    condition = ! can(index([
#      for mp in var.maps :
#      try(tolist(mp), toset(mp), tonumber(mp), tobool(mp), tostring(mp), null) == null
#      ]
#    , false))
#    error_message = "The `maps` variable must be a list of maps and/or objects. Not all elements meet this requirement."
#  }
}

variable "append_list" {
  type        = bool
  description = "A boolean flag to enable/disable appending lists instead of overwriting them."
  default     = false
}

variable "deep_copy_list" {
  type        = bool
  description = "A boolean flag to enable/disable merging of list elements one by one."
  default     = false
}
