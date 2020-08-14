variable "env" {
  description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
}

variable "location" {
  description = "(Required) location for the deployment. Can be overruled by defining location in individual resource groups map structure"
}

variable "tags" {
  description = "(Required) tags for the deployment"
}

variable "maxLength" {
  default = 90
  type    = number
}

variable "userDefinedString" {
  type = string
}