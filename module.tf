
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = local.names[each.value.userDefinedString]
  location = lookup(each.value, "location", null) == null ? var.location : each.value.location
  tags     = lookup(each.value, "tags", null) == null ? local.tags : merge(local.tags, each.value.tags)
}
