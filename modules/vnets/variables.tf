# VIRTUAL NETWORK NAMES


variable "hub_virtual_network_name" {
  description = "The Azure Hub Virtual Network"
  type = string
  default = "hub-vnet"
}

variable "hub_virtual_network_address_space" {
  description = "The Azure Hub Virtual Network Address Space"
  type = list(string)
  default = ["10.0.0.0/16"]
}

variable "spoke_virtual_network_name" {
  description = "The Azure Spoke Virtual Network"
  type = string
  default = "spoke-vnet"
}

variable "spoke_virtual_network_address_space" {
  description = "The Azure Spoke Virtual Network Address Space"
  type = list(string)
  default = ["10.1.0.0/16"]
}


variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

 