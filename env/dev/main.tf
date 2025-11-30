resource "azurerm_resource_group" "data_lake" {
  name     = var.resource_group_name
  location = var.location
}

module "storage_account" {
  source = "../../modules/storage_account"

  resource_group_name     = azurerm_resource_group.data_lake.name
  location                = var.location
  storage_account_name    = var.storage_account_name
  bronze_container_name   = var.bronze_container_name
  silver_container_name   = var.silver_container_name
  gold_container_name     = var.gold_container_name
}
