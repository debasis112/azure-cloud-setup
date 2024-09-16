# Create a ms sql server
resource "azurerm_mssql_server" "sql-server-01" {
  name                         = "debasis-project-mssqlserver-01"
  resource_group_name          = data.azurerm_resource_group.rsg-01.name
  location                     = "Central India"
  version                      = "12.0"
  administrator_login          = var.mssqlserver_admin_name
  administrator_login_password = var.mssqlserver_admin_pass
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = var.ad_admin_name
    object_id      = var.ad_admin_obj_id // Debasis Panda
  }

  tags = local.common_tags
}