variable "base_name" {
  type        = string
  description = "Base Name for the groups to create (eg. project-name)"
  default     = null
}

variable "owner" {
  type        = list(any)
  description = "Owner of the group"
  default     = null
}

variable "assign_id" {
  type        = string
  description = "Assign groups to an ID"
  default     = null
}

variable "user_role_map" {
  type        = map(object({ name = string, role = string }))
  description = "An object with names and permissions (Built-in)"
  default = {
    Owner = {
      name = "owner"
      role = "Owner"
    },
    Contributor = {
      name = "contributor"
      role = "Contributor"
    },
    Reader = {
      name = "reader"
      role = "Reader"
    }
  }
}