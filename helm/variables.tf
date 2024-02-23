variable "tenant_id_for_helm" {
  type        = string
  description = "set the value of 'tenant_id_for_helm'"
}

variable "client_id_for_helm" {
  type        = string
  description = "set the value of 'client_id_for_helm'"
}

variable "key_vault_name_for_helm" {
  type        = string
  description = "set the value of 'key_vault_name_for_helm'"
}
variable "namespace_for_helm" {
  type        = string
  description = "namespace where kubernetes resource related to csi driver will be deployed"
}

variable "service_account_name_for_helm" {
  type        = string
  description = "set the value of 'service_account_name_for_helm'"
}

variable "kube_config" {
  type        = string
  default     = "~/.kube/config"
  description = "location of kubeconfig file. If you have custom location, change the default value"
}
