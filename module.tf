resource "azurerm_resource_group" "rg" {
  name     = local.name
  location = var.location
  tags     = local.tags
}
