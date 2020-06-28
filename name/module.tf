/*
resource null_resource "name" {
  for_each = var.resource_groups

  name = substr(replace("${local.env_4}-${replace(each.value.userDefinedString, "-", "_")}-rg", local.name-regex, ""), 0, 90)
}
*/