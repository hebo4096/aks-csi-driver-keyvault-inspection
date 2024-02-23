resource "azurerm_user_assigned_identity" "azcli_csi" {
  location            = var.location
  name                = "azcli-csi-umi"
  resource_group_name = var.rg_name
}

resource "azurerm_federated_identity_credential" "azcli_csi" {
  name                = "azcli-csi-fi"
  resource_group_name = var.rg_name
  audience            = ["api://AzureADTokenExchange"]
  issuer              = var.oidc_issuer_url
  parent_id           = azurerm_user_assigned_identity.azcli_csi.id
  subject             = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
}
