# Common Variables

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Infrastructure resource group name"
  type        = string
}

#####################################################
# Backend Variables
#####################################################

variable "backend_rg_name" {
  description = "The name of the backend resource group"
  type        = string
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the blob container"
  type        = string
}

#####################################################
# VNet Variables
#####################################################

variable "vnet_name" {
  description = "The name of the Azure Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space CIDR block used by the Virtual Network."
  type        = list(string)
}

variable "public_subnet_name" {
  description = "The name of the Public Subnet"
  type        = string
}

variable "public_subnet_address_space" {
  description = "The address space CIDR block used by the Public Subnet"
  type        = list(string)
}

variable "public_nsg_name" {
  description = "The name of the Public Network Security Group"
  type        = string
}

variable "private_subnet_name" {
  description = "The name of the Private Subnet"
  type        = string
}

variable "private_subnet_address_space" {
  description = "The address space CIDR block used by the Private Subnet"
  type        = list(string)
}

variable "private_nsg_name" {
  description = "The name of the Private Network Security Group"
  type        = string
}

###############################################
# AKS
##############################################

variable "aks_name" {
  description = "The name of the Azure Kubernetes CLuster"
  type        = string
}

variable "node_count" {
  description = "Node Count"
  type        = number
}

variable "vm_size" {
  description = "Vm Size"
  type        = string
}

variable "acr_name" {
  description = "Globally unique ACR name"
  type        = string
}

variable "acr_sku" {
  description = "ACR SKU"
  type        = string
  default     = "Basic"
}
