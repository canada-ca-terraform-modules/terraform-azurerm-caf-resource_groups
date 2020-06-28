output "test" {
  description = "Returns the gccaf compliant name of resource group objects created"
  value       = module.test.userDefinedString_replaced
}

output "names" {
  description = "Returns the gccaf compliant name of resource group objects created"
  value       = module.test.names
}

