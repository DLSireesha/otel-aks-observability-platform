
# User-assigned managed identity for AKS
resource "azurerm_user_assigned_identity" "aks" {
  name                = "${var.aks_name}-identity"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Grant Network Contributor on the private subnet
resource "azurerm_role_assignment" "aks_subnet_network" {
  scope                = var.subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

# Grant Network Contributor on the private route table
resource "azurerm_role_assignment" "aks_route_table_network" {
  scope                = var.route_table_id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.aks_name

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.vm_size
    vnet_subnet_id = var.subnet_id
  }

  node_provisioning_profile {
    mode = "Manual"
  }

  # User-assigned managed identity
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  # Ensure permissions are assigned before AKS creation
  depends_on = [
    azurerm_role_assignment.aks_subnet_network,
    azurerm_role_assignment.aks_route_table_network
  ]
}

