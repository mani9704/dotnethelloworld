output "resource_group_name" { value = azurerm_resource_group.rg.name }
output "app_service_plan"    { value = azurerm_service_plan.plan.name }
output "webapp_name"         { value = azurerm_linux_web_app.web.name }
output "webapp_url"          { value = "https://${azurerm_linux_web_app.web.default_hostname}" }
