variable "rg_name" {
  description = "Name of the resource group where the container app will be deployed"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}

variable "image_name" {
  description = "Container image name for the app"
  type        = string
}
