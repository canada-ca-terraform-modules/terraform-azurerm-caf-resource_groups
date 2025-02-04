variable "resourceGroups" {
  description = "Resource groups to deploy"
  type        = any
  default = {
    "AutomationAccount" = {
      # customName        = "something_something_automation-rg" # (Optional) Custom name for the RG. Usefull if existing name does not match computed one
      # managed_by        = "/some/adure/id"                    # (Optional) The ID of the resource or application that manages this Resource Group.
    }
    "Backups"    = {}
    "Network"    = {}
    "Keyvault"   = {}
    "Logs"       = {}
    "DNS"        = {}
    "Management" = {}
  }
}

module "resource_groups_L1" {
  source   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups.git?ref=v2.1.0"
  for_each = var.resourceGroups

  userDefinedString = each.key
  env               = var.env
  location          = var.location
  group             = var.group
  project           = var.project
  customName        = try(each.value.customName, null)
  managed_by        = try(each.value.managed_by, null)
  tags              = var.tags
}

locals {
  resource_groups_L1 = module.resource_groups_L1
  resource_groups    = module.resource_groups_L1
}
