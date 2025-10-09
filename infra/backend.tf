terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatestorage9704"  # must be globally unique
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
