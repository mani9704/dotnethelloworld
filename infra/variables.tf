variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "image_name" {
  type        = string
  description = "Docker image name"
}
