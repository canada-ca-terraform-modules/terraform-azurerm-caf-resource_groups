variable "resourceGroups" {
  description = "Resource groups to deploy"
  type = any
  default = {}
}

module "resource_groups_L2" {
  source = "/home/max/devops/modules/terraform-azurerm-caf-resource_groups"
  for_each = var.resourceGroups

  userDefinedString = each.key
  env = var.env
  location = var.location
  group = var.group
  project = var.project
  resource_group = each.value
  tags = var.tags
}

locals {
  resource_groups_L2 = module.resource_groups_L2
  resource_groups_all = merge(local.resource_groups_L1, local.resource_groups_L2)
}
