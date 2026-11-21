
output "acr_name" {
  description = "Azure Container Registry name"
  value       = azurerm_container_registry.acr.name
}

output "acr_id" {
  description = "Azure Container Registry resource ID"
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "ACR login server"
  value       = azurerm_container_registry.acr.login_server
}
