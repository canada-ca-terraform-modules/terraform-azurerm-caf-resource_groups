output "object" {
  description = "Returns the full set of resource group objects created"
  depends_on  = [azurerm_resource_group.rg]

  value = azurerm_resource_group.rg
}


