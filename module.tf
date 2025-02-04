resource "azurerm_resource_group" "rg" {
  name       = var.customName == null ? local.name : var.customName
  location   = var.location
  managed_by = var.managed_by
  tags       = merge(local.tags, var.customTags)
}
