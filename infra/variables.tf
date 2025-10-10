variable "environment" {
  description = "Deployment environment (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be deployed"
  type        = string
}

variable "image_name" {
  description = "Container image to deploy"
  type        = string
}
