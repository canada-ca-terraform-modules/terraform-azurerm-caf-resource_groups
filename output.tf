output "object" {
  description = "Returns the resource group objects created"
  value = azurerm_resource_group.rg
}

output "name" {
  value = azurerm_resource_group.rg.name
}

output "id" {
  value = azurerm_resource_group.rg.id
}