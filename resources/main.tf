// Resource group Creation
resource "azurerm_resource_group" "rsg-01" {
  name     = var.rg_name
  location = var.location # or "South India" or "West India"
  tags     = local.common_tags
}

# MS SQL server
resource "azurerm_mssql_server" "sql-server-01" {
  name                         = var.mssqlserver_name
  resource_group_name          = azurerm_resource_group.rsg-01.name
  location                     = azurerm_resource_group.rsg-01.location
  version                      = "12.0"
  administrator_login          = var.mssqlserver_admin_name
  administrator_login_password = var.mssqlserver_admin_pass
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = var.ad_admin_name
    object_id      = var.ad_admin_obj_id
  }
  tags = local.common_tags
}

# MS SQL DATABASE
resource "azurerm_mssql_database" "sql-database-01" {
  name         = var.mssqldatabase_name
  server_id    = azurerm_mssql_server.sql-server-01.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  // license_type = "LicenseIncluded"
  max_size_gb  = 20

  tags = local.common_tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

# // MS SQL DATABASE Firewall
# // Database firewall rule-01
# # resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
# #   name             = "personal-asset-01"
# #   server_id        = azurerm_mssql_server.sql-server-01.id
# #   start_ip_address = "192.168.103.19"
# #   end_ip_address   = "192.168.103.19"
# # }

# /////////////////////////////////////////////

# # ARC Test

# ////////////////////////////////////////////

# resource "azurerm_container_registry" "acr" {
#   name                     = "debacrregistry"
#   resource_group_name      = azurerm_resource_group.rsg-01.name
#   location                 = azurerm_resource_group.rsg-01.location
#   sku                      = "Basic"
#   admin_enabled            = false  # Default will be disable and we use service principals for more security.
#   tags     = local.common_tags
# }

///////////////////////////////////////
////   User assigned Identity /////////
//////////////////////////////////////
# resource "azurerm_user_assigned_identity" "identity-01" {
#   location            = azurerm_resource_group.rsg-01.location
#   name                = "test-01"
#   resource_group_name = azurerm_resource_group.rsg-01.name
# }

///////////////////////////////////////
/////////// Kubctl Testing      ///////
//////////////////////////////////////

# resource "azurerm_kubernetes_cluster" "kbcl-01" {
#   name                = "debKub01"
#   location            = azurerm_resource_group.rsg-01.location
#   resource_group_name = azurerm_resource_group.rsg-01.name

#   default_node_pool {
#     name       = "firstcount"
#     node_count = 1 # Can be increased as 1, 3, 5 based on usage
#     vm_size   = "Standard_DS1_v2" # Change as needed
#     # Few types are:
#         # Standard_DS1_v2 (1 vCPU, 3.5 GB RAM) – Suitable for small workloads
#         # Standard_D2s_v3 (2 vCPUs, 8 GB RAM)
#         # Standard_D4s_v3 (4 vCPUs, 16 GB RAM)
#         # Standard_E4s_v3 (4 vCPUs, 32 GB RAM) – Memory-optimized
#         # Standard_F4s_v2 (4 vCPUs, 8 GB RAM) – Compute-optimized
#     node_labels = local.common_tags
#   }

#   identity {
#     type = "SystemAssigned, UserAssigned"
#     identity_ids = [
#       azurerm_user_assigned_identity.identity-01.id
#     ]
#   }

#   tags = local.common_tags
# }




/////////////////////////////////////////////////////////

# resource "azurerm_kubernetes_cluster" "kbcl-01" {
#   name                = "example-aks1"
#   location            = azurerm_resource_group.rsg-01.location
#   resource_group_name = azurerm_resource_group.rsg-01.name
#   dns_prefix          = "exampleaks1"

#   default_node_pool {
#     name       = "default"
#     node_count = 1
#     vm_size    = "Standard_D2s_v3" # Change as needed
#     # Few types are:
#         # Standard_DS1_v2 (1 vCPU, 3.5 GB RAM) – Not Suitable for my workloads
#         # Standard_D2s_v3 (2 vCPUs, 8 GB RAM) - Suitable for my workload
#         # Standard_D4s_v3 (4 vCPUs, 16 GB RAM)
#         # Standard_E4s_v3 (4 vCPUs, 32 GB RAM) – Memory-optimized
#         # Standard_F4s_v2 (4 vCPUs, 8 GB RAM) – Compute-optimized
#     node_labels = local.common_tags
#   }

#   identity {
#     type = "SystemAssigned"
#   }

#   tags = local.common_tags
# }

# //////////////////////////////////////////////////////////

# resource "azurerm_kubernetes_cluster_node_pool" "kub-node-pool-01" {
#   name                  = "internalpool"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.kbcl-01.id
#   vm_size               = "Standard_D2s_v3"
#   node_count            = 1

#   # Custom OS settings
#   os_disk_size_gb      = 200 # Minimum OS disk size
#   max_pods             = 50  # Max pods for Standard_DS1_v2

#   # Node labels and taints for workload scheduling
  

#   # Specify max_surge for upgrades
#   upgrade_settings {
#     max_surge = 1  # Allow 1 additional node during upgrades
#   }

#   tags = local.common_tags
# }

# /////////////////////
# //////////////////////
# //////////////////////

# resource "kubernetes_deployment" "deploy-01" {
#   metadata {
#     name      = "nodejs-web-pages"
#     namespace = "default"
#   }

#   spec {
#     replicas = 2

#     selector {
#       match_labels = {
#         app = "nodejs-app"
#       }
#     }

#     template {
#       metadata {
#         labels = {
#           app = "nodejs-app"
#         }
#       }

#       spec {
#         container {
#           name  = "nodejs-container"
#           image = "${azurerm_container_registry.acr.login_server}/project-work:latest" # Adjust image name

#           port {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "kub-ser-01" {
#   metadata {
#     name      = "nodejs-service"
#     namespace = "default"
#   }

#   spec {
#     type = "LoadBalancer"

#     port {
#       port        = 80
#       target_port = 80
#     }

#     selector = {
#       app = "nodejs-app"
#     }
#   }
# }

