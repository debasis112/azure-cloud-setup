provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}


# provider "kubernetes" {
#   host                   = data.azurerm_kubernetes_cluster.kbcl-01.kube_admin_config[0].host
#   token                  = data.azurerm_kubernetes_cluster.kbcl-01.kube_admin_config[0].kube_admin_token
#   client_certificate     = base64decode(data.azurerm_kubernetes_cluster.kbcl-01.kube_admin_config[0].client_certificate)
#   client_key             = base64decode(data.azurerm_kubernetes_cluster.kbcl-01.kube_admin_config[0].client_key)
#   cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.kbcl-01.kube_admin_config[0].cluster_ca_certificate)
# }