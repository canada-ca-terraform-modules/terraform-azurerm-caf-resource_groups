# Creates one or multiple resource groups
Sets one or more resource groups, each of them in a specific Azure region.

Reference the module to a specific version (recommended):
```hcl
module resource_groups {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource_groups?ref=v1.0.0"
  resource_groups = {
    AutomationAccount-rg = { userDefinedString = "${var.project}_AutomationAccount" },
    Backups-rg           = { userDefinedString = "${var.project}_Backups" },
    Network-rg           = { userDefinedString = "${var.project}_Network" },
    Keyvault-rg          = { userDefinedString = "${var.project}_Keyvault" },
    Logs-rg              = { userDefinedString = "${var.project}_Logs" },
    test-rg              = { userDefinedString = "${var.project}_test" },
    DNS-rg               = { userDefinedString = "${var.project}_DNS" },
    Management-rg        = { userDefinedString = "${var.project}_Management" },
  }
  env      = var.env
  location = var.location
  tags     = var.tags
}

locals {
  resource_groups = module.resource_groups.object
}
```

## Refering to resource groups

```
resource_group = local.resource_groups.DNS.rg
```

## Inputs 

| Name              | Type   | Default | Description                                                                                                                          |
| ----------------- | ------ | ------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| resource_group    | object | None    | (Required) The resource group object where to create the resource. Changing this forces a new resource to be created.                |
| location          | string | None    | (Required) The location the all resource groups are created in. Can be overruled by configuring a location in the resource_group map |
| tags              | map    | None    | (Required) Map of tags for the deployment. Additional tags per group can be added in the resource_group map                          |
| env               | string | None    | (Required) env name                                                                                                                  |
| userDefinedString | string | None    | (Required) userDefinedString to be Used.                                                                                             |

## Parameters

### resource_groups
(Required) Object that describes the resource groups to be created with their geo. 
Global group of tags will be added to all RG, specific tags can be added per RG.

```hcl
variable "resource_groups" {
  description = "(Required) Map of the resource groups to create"
}
```

Example of structure: 
```hcl
resource_groups = {
    apim          = { 
                    name     = "-apim-demo"
    },
    networking    = {    
                    name     = "-networking-demo"
    },
    insights      = { 
                    name     = "-insights-demo"
                    location = "francecentral" 
                    tags     = {
                      special     = "France location needed"
                      approver     = "Gunter"
                    }   
    },
}
```

# Outputs
| Name   | Type   | Description                                                   |
| ------ | ------ | ------------------------------------------------------------- |
| object | object | Returns the full set of created resource groups as an object. |
