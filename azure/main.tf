data "azurerm_client_config" "current_context" {}

resource "azurerm_resource_group" "this" {
  name     = "aks-csi-wid-rg"
  location = var.location
}

# modules related to Azure Kubernetes Service (AKS)
module "aks" {
  source = "./modules/aks"

  rg_name              = azurerm_resource_group.this.name
  location             = var.location
  service_account_name = var.service_account_name
  namespace            = var.namespace
}

# modules related to user-assigned managed ID
module "managed_id" {
  source = "./modules/managed-id"

  rg_name  = azurerm_resource_group.this.name
  location = var.location

  namespace            = var.namespace
  service_account_name = var.service_account_name
  oidc_issuer_url      = module.aks.oidc_issuer_url
}

# modules related to Key Vault
module "keyvault" {
  source = "./modules/keyvault"

  rg_name                   = azurerm_resource_group.this.name
  location                  = var.location
  current_context_object_id = data.azurerm_client_config.current_context.object_id
  tenant_id                 = data.azurerm_client_config.current_context.tenant_id
  umi_principal_id          = module.managed_id.umi_pincipal_id
}

