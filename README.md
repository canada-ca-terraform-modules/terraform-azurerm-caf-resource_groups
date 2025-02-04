# AzureRM Resource Group V2

[.ESLZ/resourcegroups.tfvars](.ESLZ/resourcegroups.tfvars)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customName"></a> [customName](#input\_customName) | (Optional) Custom name for the resource group. If not provided, the name will be generated based on the project and env variables | `string` | `null` | no |
| <a name="input_customTags"></a> [customTags](#input\_customTags) | (Optional) Custom tags to add to the resource group | `map(string)` | `{}` | no |
| <a name="input_env"></a> [env](#input\_env) | (Required) You can use a prefix to add to the list of resource groups you want to create | `string` | n/a | yes |
| <a name="input_group"></a> [group](#input\_group) | (Required) Group field of the subscription. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location for the deployment. Can be overruled by defining location in individual resource groups map structure | `string` | `"canadacentral"` | no |
| <a name="input_managed_by"></a> [managed\_by](#input\_managed\_by) | (Optional) The ID of the resource that manages this resource group. | `string` | `null` | no |
| <a name="input_project"></a> [project](#input\_project) | (Required) Name of the project that resource group belongs to. Will be used to format the name | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Required) tags for the deployment | `map(string)` | `{}` | no |
| <a name="input_userDefinedString"></a> [userDefinedString](#input\_userDefinedString) | (Required) User Defined string that will be in the name of the resource group. Must be unique within a subscription | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Returns the id of the resource group |
| <a name="output_location"></a> [location](#output\_location) | Returns the location of the resource group |
| <a name="output_name"></a> [name](#output\_name) | Returns the name of the resource group |
| <a name="output_resource-group-object"></a> [resource-group-object](#output\_resource-group-object) | Returns the resource group object created |
| <a name="output_tags"></a> [tags](#output\_tags) | Returns the tags of the resource groups |
<!-- END_TF_DOCS -->