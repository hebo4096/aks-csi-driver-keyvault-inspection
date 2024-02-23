output "umi_client_id" {
  value = azurerm_user_assigned_identity.azcli_csi.client_id
}

output "umi_pincipal_id" {
  value = azurerm_user_assigned_identity.azcli_csi.principal_id
}