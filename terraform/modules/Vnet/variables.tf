variable "vnet_name" {
  description = "The name of the Virtual Network (VNet)."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where all resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed (e.g., East US, West Europe)."
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