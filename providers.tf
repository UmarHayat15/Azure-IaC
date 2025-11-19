terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.12.0"
    }
  }

#   required_providers {
#     azuread = {
#       source = "hashicorp/azuread"
#       version = "3.0.2"
#     }
#   }
}

provider "azurerm" {
  features {}
  subscription_id = var.azurerm_subscription_id
}

# provider "azuread" {
#   tenant_id = var.azurerm_tenent_id
# }