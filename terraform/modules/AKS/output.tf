
output "aks_cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_id" {
  description = "Resource ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

# Control-plane managed identity
output "aks_identity_id" {
  description = "Resource ID of the AKS control-plane identity"
  value       = azurerm_user_assigned_identity.aks.id
}

output "aks_identity_client_id" {
  description = "Client ID of the AKS control-plane identity"
  value       = azurerm_user_assigned_identity.aks.client_id
}

output "aks_identity_principal_id" {
  description = "Principal ID of the AKS control-plane identity"
  value       = azurerm_user_assigned_identity.aks.principal_id
}

# Kubelet managed identity
output "kubelet_identity" {
  description = "Object ID of the AKS kubelet identity"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

