
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups

  name     = substr(replace("${local.env_4}-${replace(each.value.userDefinedString, "-", "_")-rg}", local.name-regex, ""), 0, 90)
  location = lookup(each.value, "location", null) == null ? var.location : each.value.location
  tags     = lookup(each.value, "tags", null) == null ? local.tags : merge(local.tags, each.value.tags)
}
