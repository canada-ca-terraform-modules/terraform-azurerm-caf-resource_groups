variable "env" {
  description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
  type = string
}

variable "customName" {
  description = "(Optional) Custom name for the resource group. If not provided, the name will be generated based on the project and env variables"
  type = string
  default = null
}

variable "customTags" {
  description = "(Optional) Custom tags to add to the resource group"
  type = map(string)
  default = {}
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

variable "location" {
  description = "Location for the deployment. Can be overruled by defining location in individual resource groups map structure"
  type = string
  default = "canadacentral"
}

variable "managed_by" {
  description = "(Optional) The ID of the resource that manages this resource group."
  type = string
  default = null
}

variable "tags" {
  description = "(Required) tags for the deployment"
  type = map(string)
  default = {}
}