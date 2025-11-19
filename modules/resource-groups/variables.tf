# RESOURCE GROUP NAMES

variable "resource_group_name" {
  description = "The Azure Resource Group name"
  type = string
  default = "avd-rg2"
}

variable "resource_group_location" {
  description = "The Azure Resource Group Location"
  type = string
  default = "East US"
}
