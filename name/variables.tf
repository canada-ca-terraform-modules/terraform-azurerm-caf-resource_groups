variable "env" {
  description = "(Required)"
  type        = string
}

variable "nameMap" {
  description = "(Required)"
}

variable "maxLength" {
  default = 90
  type    = number
}