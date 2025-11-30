variable "location" {
  type        = string
  description = "Azure region for backend resources"
  default     = "eastus"
}

variable "backend_rg_name" {
  type        = string
  description = "Resource Group name for Terraform backend"
  default     = "rg-tfstate"
}

variable "backend_storage_account_name" {
  type        = string
  description = "Storage Account name for Terraform backend"
  default     = "tfstateaccountvip"
}

variable "backend_container_name" {
  type        = string
  description = "Blob container name for Terraform backend"
  default     = "tfstate"
}
