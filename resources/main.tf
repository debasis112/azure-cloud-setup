// Resource group Creation
resource "azurerm_resource_group" "rsg-01" {
  name     = var.rg_name
  location = var.location # or "South India" or "West India"
  tags     = local.common_tags
}

// MS SQL server
# resource "azurerm_mssql_server" "sql-server-01" {
#   name                         = var.mssqlserver_name
#   resource_group_name          = azurerm_resource_group.rsg-01.name
#   location                     = azurerm_resource_group.rsg-01.location
#   version                      = "12.0"
#   administrator_login          = var.mssqlserver_admin_name
#   administrator_login_password = var.mssqlserver_admin_pass
#   minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = var.ad_admin_name
#     object_id      = var.ad_admin_obj_id
#   }
#   tags = local.common_tags
# }

# // MS SQL DATABASE
# resource "azurerm_mssql_database" "sql-database-01" {
#   name         = var.mssqldatabase_name
#   server_id    = azurerm_mssql_server.sql-server-01.id
#   collation    = "SQL_Latin1_General_CP1_CI_AS"
#   // license_type = "LicenseIncluded"
#   max_size_gb  = 20

#   tags = local.common_tags

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
# }

// MS SQL DATABASE Firewall
# # // Database firewall rule-01
# # resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
# #   name             = "personal-asset-01"
# #   server_id        = azurerm_mssql_server.sql-server-01.id
# #   start_ip_address = "192.168.103.19"
# #   end_ip_address   = "192.168.103.19"
# # }

/////////////////////////////////////////////

# ARC Test

////////////////////////////////////////////

resource "azurerm_container_registry" "acr" {
  name                     = "debacrregistry"
  resource_group_name      = azurerm_resource_group.rsg-01.name
  location                 = azurerm_resource_group.rsg-01.location
  sku                      = "Basic"
  admin_enabled            = true  # You can also disable this and use service principals for more security.
  tags     = local.common_tags
}

// SPN for acr
resource "azuread_service_principal" "acr_sp-01" {
  client_id = azurerm_container_registry.acr.id
}

resource "azuread_service_principal_password" "acr_sp_password-01" {
  service_principal_id = azuread_service_principal.acr_sp-01.id
  value                = var.client_secret  # Store securely or use terraform variables/secrets
  end_date             = "2099-12-31T23:59:59Z"
}
