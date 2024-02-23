resource "kubernetes_namespace" "this" {
  metadata {
    name = var.namespace_for_helm
  }
}

module "azure_csi" {
  source = "./azure-csi"

  tenant_id            = var.tenant_id_for_helm
  client_id            = var.client_id_for_helm
  namespace            = var.namespace_for_helm
  service_account_name = var.service_account_name_for_helm
  key_vault_name       = var.key_vault_name_for_helm

}
