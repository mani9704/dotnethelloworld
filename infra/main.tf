resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

locals {
  name_base     = "${var.project_name}-${var.environment}"
  webapp_name   = var.webapp_name_override != "" ? var.webapp_name_override : "${replace(local.name_base, "_", "-")}-${random_string.suffix.result}"
  rg_name       = "rg-${local.name_base}"
  plan_name     = "asp-${local.name_base}"
  law_name      = "law-${local.name_base}"
  ai_name       = "appi-${local.name_base}"
  tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_service_plan" "plan" {
  name                = local.plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = var.plan_sku
  tags                = local.tags
}

resource "azurerm_log_analytics_workspace" "law" {
  name                = local.law_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = local.tags
}

resource "azurerm_application_insights" "appi" {
  name                = local.ai_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  application_type    = "web"
  workspace_id        = azurerm_log_analytics_workspace.law.id
  tags                = local.tags
}

resource "azurerm_linux_web_app" "web" {
  name                = local.webapp_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id
  tags                = local.tags

  https_only = true

  site_config {
    ftps_state = "Disabled"
    minimum_tls_version = "1.2"

    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE"         = "1"
    "APPINSIGHTS_INSTRUMENTATIONKEY"   = azurerm_application_insights.appi.instrumentation_key
    "APPLICATIONINSIGHTS_CONNECTION_STRING" = azurerm_application_insights.appi.connection_string
    "ASPNETCORE_ENVIRONMENT"           = var.environment
  }

  logs {
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 35
      }
    }
    detailed_error_messages = true
    failed_request_tracing  = true
  }

  identity {
    type = "SystemAssigned"
  }
}
