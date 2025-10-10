variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "image_name" {
  description = "Container image name for deployment"
  type        = string
  default     = "ghcr.io/mani7reddy/dotnethelloworld:latest"
}
