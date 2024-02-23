resource "helm_release" "azure_csi" {
  name  = var.namespace
  chart = "${path.root}/helm-chart"

  set {
    name  = "workloadIdentity.enabled"
    value = true
  }

  set {
    name  = "workloadIdentity.clientId"
    value = var.client_id
  }

  set {
    name  = "serviceAccountName"
    value = var.service_account_name
  }

  set {
    name  = "namespace"
    value = var.namespace
  }

  set {
    name  = "csiDriver.tenantId"
    value = var.tenant_id
  }

  set {
    name  = "csiDriver.clientId"
    value = var.client_id
  }

  set {
    name  = "csiDriver.keyVaultName"
    value = var.key_vault_name
  }
}
