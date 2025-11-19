# Resource group name
variable "resource_group_name" {
  description = "The name of the resource group in which the storage account should be created."
  type        = string
}

# Location
variable "location" {
  description = "The location/region where the storage account should be created."
  type        = string
}

# Subnet ID
variable "subnet_id" {
  description = "The ID of the subnet in which the storage account should be created."
  type        = string
}