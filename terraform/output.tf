#####################################################
# Backend Outputs
#####################################################

output "storage_account_name" {
  description = "Storage Account used for Terraform state"
  value       = module.backend.storage_account_name
}

output "container_name" {
  description = "Blob container storing Terraform state"
  value       = module.backend.container_name
}

#####################################################
# VNet Outputs
#####################################################

output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "VNet ID"
}

output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "VNet Name"
}

output "public_subnet_id" {
  value       = module.vnet.public_subnet_id
  description = "Public Subnet ID"
}

output "private_subnet_id" {
  value       = module.vnet.private_subnet_id
  description = "Private Subnet ID"
}

################################################
# AKS
################################################

output "aks_cluster_name" {
  description = "The name of the Azure Kubernetes Service Cluster"
  value       = module.aks.aks_cluster_name
}

################################################
# ACR Outputs
################################################

output "acr_name" {
  description = "Azure Container Registry name"
  value       = module.acr.acr_name
}

output "acr_login_server" {
  description = "Azure Container Registry login server"
  value       = module.acr.login_server
}

output "acr_id" {
  description = "Azure Container Registry resource ID"
  value       = module.acr.acr_id
}

################################################
# AKS Identity Outputs
################################################

output "aks_cluster_id" {
  description = "AKS cluster resource ID"
  value       = module.aks.aks_cluster_id
}

output "aks_identity_client_id" {
  description = "AKS control-plane identity client ID"
  value       = module.aks.aks_identity_client_id
}

output "aks_identity_principal_id" {
  description = "AKS control-plane identity principal ID"
  value       = module.aks.aks_identity_principal_id
}

output "aks_kubelet_identity" {
  description = "AKS kubelet identity object ID"
  value       = module.aks.kubelet_identity
}
