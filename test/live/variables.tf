variable "env" {
  description = "Environment prefix used in the generated resource group name"
  type        = string
  default     = "livetest"
}

variable "location" {
  description = "Location for the live-test resource group"
  type        = string
  default     = "canadacentral"
}

variable "group" {
  description = "Group field passed through to the module under test"
  type        = string
  default     = "yourgroup"
}

variable "project" {
  description = "Project field passed through to the module under test"
  type        = string
  default     = "yourproject"
}

variable "tags" {
  description = "Tags applied to the resource group created by this harness"
  type        = map(string)
  default = {
    purpose = "module-live-test"
  }
}

variable "pr_number" {
  description = <<-EOT
    Suffix applied to the userDefinedString so concurrent PRs against this
    module never collide on the same sandbox subscription. CI sources this
    from `TF_VAR_pr_number` (`github.event.number`); manual runs can leave
    the default or pass their own value.
  EOT
  type        = string
  default     = "manual"
}
