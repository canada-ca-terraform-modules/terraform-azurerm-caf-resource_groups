output "resource-group-object" {
  description = "Returns the resource group object created"
  value = azurerm_resource_group.rg
}

output "name" {
  description = "Returns the name of the resource group"
  value = azurerm_resource_group.rg.name
}

output "id" {
  description = "Returns the id of the resource group"
  value = azurerm_resource_group.rg.id
}

output "location" {
  description = "Returns the location of the resource group"
  value = azurerm_resource_group.rg.location
}

output "tags" {
  description = "Returns the tags of the resource groups"
  value = azurerm_resource_group.rg.tags
}