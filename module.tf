resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = var.location
  tags     = merge(local.tags, try(var.resource_group.tags, {}))
}
