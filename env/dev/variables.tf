variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure region for resources"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account name"
}

variable "bronze_container_name" {
  type        = string
  description = "Bronze container name"
}

variable "silver_container_name" {
  type        = string
  description = "Silver container name"
}

variable "gold_container_name" {
  type        = string
  description = "Gold container name"
}
