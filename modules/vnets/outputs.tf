output "hub_name" {
  value = azurerm_virtual_network.hub_vnet.name
}

output "spoke_name" {
    value = azurerm_virtual_network.spoke_vnet.name
}