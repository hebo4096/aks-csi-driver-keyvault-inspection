variable "client_id" {
  type        = string
  description = "client ID of user-assigned Managed ID"
}

variable "tenant_id" {
  type        = string
  description = "tenant ID where Managed ID exists"
}

variable "key_vault_name" {
  type        = string
  description = "name of target key vault"
}

variable "namespace" {
  type        = string
  description = "namespace to manage csi related resources"
}

variable "service_account_name" {
  type        = string
  description = "serviceaccount to associate Pod to user-assigned managed ID"
}
