# Create a Azure Storage Account
resource "azurerm_storage_account" "storage_account" {
  name = "storageacdcruz1"
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}

# Storage account network rules
resource "azurerm_storage_account_network_rules" "example" {
  storage_account_id = azurerm_storage_account.storage_account.id

  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [var.subnet_id]
  bypass                     = ["Metrics"]
}

# Storage share
resource "azurerm_storage_share" "storage_share" {
  name = "fileshare"
  storage_account_id = azurerm_storage_account.storage_account.id
  quota = 50
}


# storage file share
resource "azurerm_storage_share_file" "file_share" {
  name = "fileshare"
  storage_share_id  = azurerm_storage_account.storage_account.id
}