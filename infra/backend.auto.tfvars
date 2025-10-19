# Used by the azurerm backend; these must already exist
resource_group_name  = "rg-tfstate"
storage_account_name = "tfstatestorage9704"
container_name       = "tfstate"
key                  = "dotnet9api/dev/terraform.tfstate"
