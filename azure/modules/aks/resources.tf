resource "azurerm_kubernetes_cluster" "this" {
  name                = "csi-wid-k8s-cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "csi-wid-k8s"

  # requirements to enable workload identity
  oidc_issuer_enabled       = true
  workload_identity_enabled = true

  # required kubernetes version under enable azure workload identity
  # see -> https://github.com/Azure/azure-workload-identity
  kubernetes_version = "1.27"

  # Node Pool settings
  default_node_pool {
    name       = "defaultnp"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }
}
