terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.19.0"
    }
  }
  required_version = ">= 0.13"
}

provider "azurerm" {
  features {}
}

locals {
  rglist = {
    1 = {
      userDefinedString = "test_1"
    },
    2 = {
      userDefinedString = "test_2"
    },
  }
}

module resource_groups_L1 {
  source   = "../../"
  for_each = local.rglist

  userDefinedString = each.value.userDefinedString
  env               = "test"
  location          = lookup(each.value, "location", "canadacentral")
  tags              = lookup(each.value, "tags", {})
}