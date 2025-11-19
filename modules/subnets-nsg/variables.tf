

# GATEWAY SUBNET NAMES
variable "gateway_subnet_name" {
  description = "The Gateway Subnet"
  type = string
  default = "GatewaySubnet"
}

# GATEWAY SUBNET ADDRESS
variable "gateway_subnet_address" {
  description = "The Gateway Subnet Address Prefix"
  type = list(string)
  default = ["10.0.0.0/24"]
}

# DMZ SUBNET NAMES
variable "dmz_subnet_name" {
  description = "The DMZ Subnet"
  type = string
  default = "DMZSubnet"
}

# DMZ SUBNET ADDRESS
variable "dmz_subnet_address" {
  description = "The DMZ Subnet Address Prefix"
  type = list(string)
  default = ["10.0.1.0/24"]
  
}

# AD SUBNET NAMES
variable "desktop_subnet_name" {
  description = "The Desktop Subnet"
  type = string
  default = "DesktopSubnet"
}

# AD SUBNET ADDRESS
variable "desktop_subnet_address" {
  description = "The Desktop Subnet Address Prefix"
  type = list(string)
  default = ["10.0.2.0/24"]
}

# ACTIVE DIRETORY SUBNET NAMES
variable "ad_subnet_name" {
  description = "The AD Subnet"
  type = string
  default = "ADSubnet"
}

# ACTIVE DIRECTORY SUBNET ADDRESS
variable "ad_subnet_address" {
  description = "The AD Subnet Address Prefix"
  type = list(string)
  default = ["10.0.3.0/24"]
}





# NSG NAMES
variable "dmz_nsg_name" {
  description = "The DMZ Network Security Group"
  type = string
  default = "dmz-nsg"
}

variable "ad_nsg_name" {
  description = "The AD Network Security Group"
  type = string
  default = "ad-nsg"
}

variable "desktop_nsg_name" {
  description = "The Desktop Network Security Group"
  type = string
  default = "desktop-nsg"
}



# Output Variables
variable "resource_group_name" {
  description = "The Resource Group Name"
  type = string
}

variable "location" {
  description = "The Azure Region"
  type = string
}

variable "virtual_network_name" {
  description = "The Virtual Network Name"
  type = string
}