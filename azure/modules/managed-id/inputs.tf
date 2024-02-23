variable "rg_name" {
  type        = string
  description = "resource group name for this project"
}

variable "location" {
  type        = string
  description = "azure region to deploy resources (ex. 'japaneast', 'eastus')"
}

variable "oidc_issuer_url" {
  type        = string
  description = "oidc issuer url to validate federated token"
}

variable "namespace" {
  type        = string
  description = "namespace to create serviceaccount resource on k8s"
}

variable "service_account_name" {
  type        = string
  description = "name of ServiceAccount for Kubernetes"
}
