# Create a virtual network within the resource group
# Address Space 10.0.0.0/16
# This VNet will host:
# - Public Subnet
# - Private Subnet

resource "azurerm_virtual_network" "otel_vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
}

# Public Subnet
# Intended Usage:
# - Bastion host
# - Jumpbox VM
# CIDR : 10.0.1.0/24

resource "azurerm_subnet" "public" {
  name                 = var.public_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.otel_vnet.name
  address_prefixes     = var.public_subnet_address_space
}

# Public NSG + Security Rule to allow SSH

resource "azurerm_network_security_group" "public_nsg" {
  name                = var.public_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate NSG to Public Subnet

resource "azurerm_subnet_network_security_group_association" "public_nsg_association" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.public_nsg.id
}

# Create a Public IP

resource "azurerm_public_ip" "nat_ip" {

  name                = "nat-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

# Private Subnet
# Intended Usage:
# - AKS Node Pools
# - Pods
# - Databases
# CIDR : 10.0.2.0/24

resource "azurerm_subnet" "private" {
  name                 = var.private_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.otel_vnet.name
  address_prefixes     = var.private_subnet_address_space
}

# Private NSG

resource "azurerm_network_security_group" "private_nsg" {
  name                = var.private_nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate NSG to Private Subnet

resource "azurerm_subnet_network_security_group_association" "private_nsg_association" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.private_nsg.id
}

# NAT Gateway for Private Subnet

resource "azurerm_nat_gateway" "nat_gateway" {

  name                = "private-nat-gateway"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"
}

# Associate Public IP address to NAT Gateway

resource "azurerm_nat_gateway_public_ip_association" "public_ip_nat_ass" {
  nat_gateway_id       = azurerm_nat_gateway.nat_gateway.id
  public_ip_address_id = azurerm_public_ip.nat_ip.id
}

# Associate NAT Gateway with Private Subnet

resource "azurerm_subnet_nat_gateway_association" "private" {
  subnet_id      = azurerm_subnet.private.id
  nat_gateway_id = azurerm_nat_gateway.nat_gateway.id
}

# Route Tables

resource "azurerm_route_table" "public_rt" {
  name                = "public-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_route_table" "private_rt" {
  name                = "private-route-table"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Associate Route tables with Subnets

resource "azurerm_subnet_route_table_association" "public_rt_ass" {
  subnet_id      = azurerm_subnet.public.id
  route_table_id = azurerm_route_table.public_rt.id
}

resource "azurerm_subnet_route_table_association" "private_rt_ass" {
  subnet_id      = azurerm_subnet.private.id
  route_table_id = azurerm_route_table.private_rt.id
}
