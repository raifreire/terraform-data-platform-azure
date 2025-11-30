#define onde o estado será armazenado (Azure Storage)
terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"              # RG que guardará o tfstate
    storage_account_name = "tfstateaccountvip"       # Storage criado só para Terraform
    container_name       = "tfstate"                 
    key                  = "dev.terraform.tfstate"   # Nome do arquivo de estado (muda por ambiente)
  }
}

