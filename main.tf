
module "resource-group" {
  source = "./modules/resource-groups"
}

module "virtual_network" {
  source = "./modules/vnets"
  resource_group_name = module.resource-group.name
  location = module.resource-group.location
}

module "subnet" {
  source = "./modules/subnets-nsg"
  resource_group_name = module.resource-group.name
  location = module.resource-group.location
  virtual_network_name = module.virtual_network.hub_name

}

module "azurerm_storage_account" {
  source = "./modules/Azure-storage-account"
  resource_group_name = module.resource-group.name
  location = module.resource-group.location
  subnet_id = module.subnet.desktop_subnet_id
}

module "AVD" {
  source = "./modules/AVD"

  resource_group_name = module.resource-group.name
  location = module.resource-group.location
  subnet_id = module.subnet.desktop_subnet_id
  primary_access_key = module.azurerm_storage_account.primary_access_key
  storage_account_type = module.azurerm_storage_account.storage_account_type
}
