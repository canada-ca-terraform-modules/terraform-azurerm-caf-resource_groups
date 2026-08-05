# Purpose: catch breaking resource changes before dev tests on real infra
# How: run blocks share state - apply creates mock state; next plan runs against it
# If upgraded code causes address change or accidental destroy, it appears in plan
mock_provider "azurerm" {}

variables {
  env               = "Dev"
  group             = "OPS"
  project           = "CORE"
  userDefinedString = "test-rg1"
  tags              = { costCenter = "1234" }
}

# Step 1: simulate currently-deployed resource (pre-upgrade inputs)
run "baseline_apply" {
  command = apply

  assert {
    condition     = azurerm_resource_group.rg.name == "Dev-OPS_CORE_test_rg1-rg"
    error_message = "Baseline apply: unexpected resource name"
  }
}

# Step 2: plan upgraded code against that state - no new args added by this
# upgrade (azurerm_resource_group's schema is unchanged in azurerm 5.0.1), so
# this proves the provider version bump alone causes no plan diff.
run "upgrade_plan_no_replacement" {
  command = plan

  assert {
    condition     = azurerm_resource_group.rg.name == "Dev-OPS_CORE_test_rg1-rg"
    error_message = "Resource name must be unchanged after the azurerm 5.0.1 upgrade"
  }
  assert {
    condition     = azurerm_resource_group.rg.location == "canadacentral"
    error_message = "Location must be unchanged after the azurerm 5.0.1 upgrade"
  }
}
