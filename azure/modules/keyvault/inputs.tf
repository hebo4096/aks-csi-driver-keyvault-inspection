variable "location" {
  type        = string
  description = "azure region to deploy resources (ex. 'japaneast', 'eastus')"
}

variable "rg_name" {
  type        = string
  description = "resource group name for this project"
}

variable "current_context_object_id" {
  type        = string
  description = "object_id of current context executing"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID where Key Vault will be hosted"
}

variable "umi_principal_id" {
  type        = string
  description = "User Assigned Managed ID to allow access to Key Vault Secret"
}