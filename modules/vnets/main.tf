# Virtual Network for Hub
resource "azurerm_virtual_network" "hub_vnet" {
  name = var.hub_virtual_network_name
  address_space = var.hub_virtual_network_address_space
  location = var.location
  resource_group_name = var.resource_group_name
}

# Virtual Network for Spoke 
resource "azurerm_virtual_network" "spoke_vnet" {
  name = var.spoke_virtual_network_name
  address_space = var.spoke_virtual_network_address_space
  location = var.location
  resource_group_name = var.resource_group_name
}


# Peering the Hub and Spoke Virtual Networks
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name = "hub-to-spoke"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.spoke_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = true
  # use_remote_gateway = false  
  
}


resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name = "spoke-to-hub"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id = azurerm_virtual_network.hub_vnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic = true
  allow_gateway_transit = false
  # use_remote_gateway = false
  
}