# MS SQL server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.sql_server_name_resg_name
  location                     = var.sql_server_location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_login
  administrator_login_password = var.sql_server_admin_login_password
  minimum_tls_version          = var.sql_server_minimum_tls_ver

  azuread_administrator {
    login_username = var.ad_admin_name
    object_id      = var.ad_admin_obj_id
  }

  tags = var.tags
}
