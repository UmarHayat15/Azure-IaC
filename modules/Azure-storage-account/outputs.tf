# Primary access key
output "primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

# Secondary access key
output "secondary_access_key" {
  value = azurerm_storage_account.storage_account.secondary_access_key
}

# Storage account name
output "storage_account_name" {
  value = azurerm_storage_account.storage_account.name
}