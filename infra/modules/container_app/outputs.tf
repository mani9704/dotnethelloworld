output "app_url" {
  description = "The default URL of the deployed Azure Container App"
  value       = azurerm_container_app.app.latest_revision_fqdn
}
