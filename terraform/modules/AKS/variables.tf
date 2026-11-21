variable "aks_name" {
  description = "The name of the Cluster"
  type        = string
}

variable "location" {
  description = "location"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "node_count" {
  description = "Node Count"
  type        = number
}

variable "vm_size" {
  description = "The Size of the VM"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "route_table_id" {
  description = "ID of the route table associated with the AKS subnet"
  type        = string
}
