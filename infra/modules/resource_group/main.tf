variable "environment" {}
variable "location" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-dotnet-${var.environment}"
  location = var.location
}

output "name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}
