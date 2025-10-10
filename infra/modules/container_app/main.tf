variable "rg_name" {}
variable "location" {}
variable "environment" {}
variable "image_name" {}

resource "azurerm_container_app_environment" "env" {
  name                = "cae-dotnet-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_container_app" "app" {
  name                         = "dotnethelloworld-${var.environment}"
  resource_group_name          = var.rg_name
  container_app_environment_id = azurerm_container_app_environment.env.id
  revision_mode                = "Single"

  ingress {
    external_enabled = true
    target_port      = 80
  }

  template {
    container {
      name   = "dotnethelloworld"
      image  = var.image_name
      cpu    = 0.5
      memory = "1Gi"
    }
  }
}

output "app_url" {
  value = "https://${azurerm_container_app.app.latest_revision_fqdn}"
}
