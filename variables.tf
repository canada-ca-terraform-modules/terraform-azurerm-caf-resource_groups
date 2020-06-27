variable "resource_groups" {
  description = "(Required) Map of the resource groups to create"
}

# Example of resource_groups data structure:
# resource_groups = {
#   apim          = { 
#                     userDefinedString = "apim-demo"
#                   },
#   networking    = {    
#                     userDefinedString = "networking-demo"
#                     location          = "southeastasia"
#                     tags              = {
#                                           special = "special-location-needed"
#                                         }  
#                   },
#   insights      = { 
#                     userDefinedString = "insights-demo" 
#                   },
# }

variable "env" {
  description = "(Required) You can use a prefix to add to the list of resource groups you want to create"
}

variable "location" {
  description = "(Required) location for the deployment. Can be overruled by defining location in individual resource groups map structure"
}

variable "tags" {
  description = "(Required) tags for the deployment"
}