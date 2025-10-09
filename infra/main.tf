
terraform {
  required_version = ">=1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.100"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# Resource Group
module "rg" {
  source      = "./modules/resource_group"
  environment = var.environment
  location    = var.location
}

# Container App Environment + App
module "containerapp" {
  source       = "./modules/container_app"
  rg_name      = module.rg.name
  location     = module.rg.location
  environment  = var.environment
  image_name   = var.image_name
}
