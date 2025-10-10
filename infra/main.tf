terraform {
  required_version = ">=1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.6"
    }
  }

  # -----------------------------
  # 💾 Remote Backend Configuration
  # -----------------------------
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "tfstatestorage9704"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

# -----------------------------
# 🏗️ Create Resource Group
# -----------------------------
module "rg" {
  source      = "./modules/resource_group"
  environment = var.environment
  location    = var.location
}

# -----------------------------
# 🚀 Deploy Container App
# -----------------------------
module "container_app" {
  source       = "./modules/container_app"
  rg_name      = module.rg.name
  location     = module.rg.location
  environment  = var.environment
  image_name   = var.image_name
}

# -----------------------------
# 🌍 Output: Application URL
# -----------------------------
output "app_url" {
  value = module.container_app.app_url
}
