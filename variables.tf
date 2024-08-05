variable "env" {
  description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
  type = string
}

variable "userDefinedString" {
  description = "(Required) User Defined string that will be in the name of the resource group. Must be unique within a subscription"
  type = string
}

variable "project" {
  description = "(Required) Name of the project that resource group belongs to. Will be used to format the name"
  type = string
}

variable "group" {
  description = "(Required) Group field of the subscription."
  type = string
}

variable "resource_group" {
  description = "(Required) Object containing resource groups paramaters"
  type = any
  default = {}
}

variable "location" {
  description = "Location for the deployment. Can be overruled by defining location in individual resource groups map structure"
  type = string
  default = "canadacentral"
}

variable "tags" {
  description = "(Required) tags for the deployment"
  type = map(string)
  default = {}
}