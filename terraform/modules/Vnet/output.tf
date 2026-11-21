output "vnet_name" {
  description = "The name of the main Virtual Network."
  value       = azurerm_virtual_network.otel_vnet.name
}

output "vnet_id" {
  description = "The unique ARM ID of the main Virtual Network."
  value       = azurerm_virtual_network.otel_vnet.id
}

output "public_subnet_name" {
  description = "The name of the Public Subnet"
  value       = azurerm_subnet.public.name
}

output "public_subnet_id" {
  description = "The unique ARM ID of the Public Subnet"
  value       = azurerm_subnet.public.id
}

output "private_subnet_name" {
  description = "The name of the Private Subnet"
  value       = azurerm_subnet.private.name
}

output "private_subnet_id" {
  description = " The unique ARM ID of the private Subnet"
  value       = azurerm_subnet.private.id
}

output "private_route_table_id" {
  description = "The ID of the private subnet route table"
  value       = azurerm_route_table.private_rt.id
}
