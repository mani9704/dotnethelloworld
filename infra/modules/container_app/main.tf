resource "azurerm_container_app" "app" {
  name                         = "dotnethelloworld-${var.environment}"
  resource_group_name           = var.rg_name
  container_app_environment_id  = azurerm_container_app_environment.env.id
  revision_mode                 = "Single"

  template {
    container {
      name   = "dotnethelloworld"
      image  = var.image_name
      cpu    = 0.5
      memory = "1Gi"

      env {
        name  = "ASPNETCORE_ENVIRONMENT"
        value = var.environment
      }
    }
  }

  ingress {
    external_enabled = true
    target_port      = 80

    traffic_weight {
      latest_revision = true
      percentage      = 100
    }
  }

  tags = {
    environment = var.environment
  }
}

resource "azurerm_container_app_environment" "env" {
  name                = "env-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
}
