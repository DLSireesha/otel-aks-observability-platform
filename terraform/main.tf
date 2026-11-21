###############################################################
#         TERRAFORM CONFIGURATION
##############################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.13.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Application resource group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Backend Module
# Creates:
# - Resource Group
# - Storage account
# - Blob container

module "backend" {
  source               = "./backend"
  rg_backend           = var.backend_rg_name
  location             = var.location
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
}

# VNet Module
# Creates:
# - VNet
# - Public Subnet
# - Private Subnet

module "vnet" {
  source                       = "./modules/Vnet"
  vnet_name                    = var.vnet_name
  resource_group_name          = azurerm_resource_group.main.name
  location                     = var.location
  address_space                = var.address_space
  public_subnet_name           = var.public_subnet_name
  public_subnet_address_space  = var.public_subnet_address_space
  public_nsg_name              = var.public_nsg_name
  private_subnet_name          = var.private_subnet_name
  private_subnet_address_space = var.private_subnet_address_space
  private_nsg_name             = var.private_nsg_name
}

# AKS 

module "aks" {
  source              = "./modules/AKS"
  aks_name            = var.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = module.vnet.private_subnet_id
  node_count          = var.node_count
  vm_size             = var.vm_size
  route_table_id      = module.vnet.private_route_table_id
}

# ACR

module "acr" {
  source = "./modules/ACR"

  acr_name            = var.acr_name
  resource_group_name = azurerm_resource_group.main.name
  location            = var.location
  sku                 = var.acr_sku
}

# Allow AKS kubelet identity to pull images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                            = module.acr.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = module.aks.kubelet_identity
  skip_service_principal_aad_check = true
}


