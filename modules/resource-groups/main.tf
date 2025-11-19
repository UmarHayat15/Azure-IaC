# Resource Group
resource "azurerm_resource_group" "avd_rg1" {
  name     = var.resource_group_name
  location = var.resource_group_location
}