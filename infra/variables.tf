variable "subscription_id" { type = string }
variable "tenant_id"       { type = string }

variable "location" {
  type    = string
  default = "eastus"
}

variable "project_name" {
  description = "Short name used to prefix resources"
  type        = string
  default     = "dotnet9api"
}

variable "environment" {
  description = "env tag and name suffix"
  type        = string
  default     = "dev"
}

# App Service plan SKU (Linux)
variable "plan_sku" {
  description = "e.g., B1, P0v3, P1v3"
  type        = string
  default     = "S1"
}

# .NET runtime version for App Service
variable "dotnet_version" {
  type    = string
  default = "9.0"
}

# Optional: custom app name; otherwise we generate one
variable "webapp_name_override" {
  type      = string
  default   = ""
  nullable  = true
}
