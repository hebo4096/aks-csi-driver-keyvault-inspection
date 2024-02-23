# outputs used for installation of azure-cli helm release
output "tenant_id_for_helm" {
  value = data.azurerm_client_config.current_context.tenant_id
}

output "client_id_for_helm" {
  value = module.managed_id.umi_client_id
}

output "key_vault_name_for_helm" {
  value = module.keyvault.keyvault_name
}

output "namespace_for_helm" {
  value = var.namespace
}

output "service_account_name_for_helm" {
  value = var.service_account_name
}

output "resource_group" {
  value = azurerm_resource_group.this.name
}

output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}
