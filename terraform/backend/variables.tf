
variable "rg_backend" {
  description = "Resource group for Terraform state storage"
  type        = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

