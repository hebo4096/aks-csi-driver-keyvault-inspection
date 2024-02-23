data "azurerm_role_definition" "kv_secret_officer" {
  name = "Key Vault Secrets Officer"
}

resource "random_id" "kv" {
  byte_length = 8
}

resource "azurerm_key_vault" "this" {
  name                = "csi-${random_id.kv.hex}"
  location            = var.location
  resource_group_name = var.rg_name

  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id

  enable_rbac_authorization = true
}

resource "azurerm_role_assignment" "current" {
  role_definition_id = data.azurerm_role_definition.kv_secret_officer.role_definition_id
  scope              = azurerm_key_vault.this.id
  principal_id       = var.current_context_object_id
}

resource "azurerm_role_assignment" "umi" {
  role_definition_id = data.azurerm_role_definition.kv_secret_officer.role_definition_id
  scope              = azurerm_key_vault.this.id
  principal_id       = var.umi_principal_id
}

# Generate Secrets to Key Vault
resource "azurerm_key_vault_secret" "example" {
  name         = "example-secret"
  value        = "example secret!!!!"
  key_vault_id = azurerm_key_vault.this.id

  depends_on = [
    azurerm_role_assignment.current
  ]
}