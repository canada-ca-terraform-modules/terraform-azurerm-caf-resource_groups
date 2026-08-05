mock_provider "azurerm" {}

variables {
  env               = "Dev"
  group             = "OPS"
  project           = "CORE"
  userDefinedString = "test-rg1"
  tags              = { costCenter = "1234" }
}

run "naming_convention" {
  command = plan

  assert {
    condition     = azurerm_resource_group.rg.name == "Dev-OPS_CORE_test_rg1-rg"
    error_message = "Name must follow {env4}-{group}_{project}_{userDefinedString}-rg convention with '-' replaced by '_' in userDefinedString"
  }
}

run "default_values" {
  command = plan

  assert {
    condition     = azurerm_resource_group.rg.location == "canadacentral"
    error_message = "Default location must be canadacentral when not overridden"
  }
  assert {
    condition     = azurerm_resource_group.rg.managed_by == null
    error_message = "managed_by must be null by default"
  }
  assert {
    condition     = azurerm_resource_group.rg.tags["module"] == "terraform-azurerm-caf-resource_groups"
    error_message = "module tag must be added from local.module_tag"
  }
}

run "custom_location" {
  command = plan
  variables {
    location = "canadaeast"
  }
  assert {
    condition     = azurerm_resource_group.rg.location == "canadaeast"
    error_message = "location override must be applied"
  }
}

run "env_longer_than_4_chars_is_truncated" {
  command = plan
  variables {
    env = "Development"
  }
  assert {
    condition     = azurerm_resource_group.rg.name == "Deve-OPS_CORE_test_rg1-rg"
    error_message = "env must be truncated to its first 4 characters (env_4) in the generated name"
  }
}

run "custom_name_override" {
  command = plan
  variables {
    customName = "existing-prod-rg"
  }
  assert {
    condition     = azurerm_resource_group.rg.name == "existing-prod-rg"
    error_message = "customName override must take priority over the generated name"
  }
}

run "custom_tags" {
  command = plan
  variables {
    customTags = { owner = "teamA" }
  }
  assert {
    condition     = azurerm_resource_group.rg.tags["owner"] == "teamA"
    error_message = "customTags must be merged into the resource group tags"
  }
}

run "managed_by_override" {
  command = plan
  variables {
    managed_by = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/managing-rg"
  }
  assert {
    condition     = azurerm_resource_group.rg.managed_by == "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/managing-rg"
    error_message = "managed_by must be passed through unchanged"
  }
}

run "long_user_defined_string_is_truncated" {
  command = plan
  variables {
    userDefinedString = "this-is-a-very-long-user-defined-string-value-used-to-exercise-the-90-character-name-truncation-rule"
  }
  assert {
    condition     = length(azurerm_resource_group.rg.name) <= 90
    error_message = "Generated name must never exceed 90 characters"
  }
  assert {
    condition     = startswith(azurerm_resource_group.rg.name, "Dev-OPS_CORE_this_is_a_very_long")
    error_message = "Truncated name must still start with the expected prefix, not be empty/mangled"
  }
}

run "invalid_characters_are_stripped" {
  command = plan
  variables {
    userDefinedString = "test$rg#1"
  }
  assert {
    condition     = azurerm_resource_group.rg.name == "Dev-OPS_CORE_testrg1-rg"
    error_message = "Characters outside 0-9A-Za-z-_. must be stripped from the generated name"
  }
}
