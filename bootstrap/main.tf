provider "azurerm" {
  features {}
  subscription_id = "847d5141-9aa8-4619-8c04-0f0f4b8da197"
}

resource "azurerm_resource_group" "backend" {
  name     = var.backend_rg_name
  location = var.location
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = var.backend_storage_account_name
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = var.backend_container_name
  storage_account_id    = azurerm_storage_account.backend_sa.id
  container_access_type = "private"
}
