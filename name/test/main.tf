# https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftresources

terraform {
  required_version = ">= 0.12.1"
}

module "test" {
  source = "../."
  env    = "CIO"
  /*
  nameMap = [
    { userDefinedString = "a-dash"
      id = "a"
    },
    { userDefinedString = "b_underscore"
      id = "b"
    }
  ]
  */
  nameMap = {
    AutomationAccount-rg = { userDefinedString = "AutomationAccount" },
    Backups-rg           = { userDefinedString = "Backups" },
    Network-rg           = { userDefinedString = "Network-test" },
    Keyvault-rg          = { userDefinedString = "Keyvault" },
    Logs-rg              = { userDefinedString = "Logs" },
    DNS-rg               = { userDefinedString = "DNS" },
    Management-rg        = { userDefinedString = "Management" },
  }
}