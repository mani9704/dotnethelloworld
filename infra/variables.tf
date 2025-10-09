variable "environment" {
  type        = string
  description = "Deployment environment name"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "East US"
}

variable "image_name" {
  type        = string
  description = "Docker image name (e.g. ghcr.io/mani/dotnethelloworld:latest)"
}

