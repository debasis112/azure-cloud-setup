data "azurerm_resource_group" "rsg-01" {
  name = var.rg_name
}

data "azurerm_mssql_server" "sql-server-01" {
  name                = var.mssqlserver_name
  resource_group_name = data.azurerm_resource_group.rsg-01.name
}

# data "azurerm_mssql_database" "sql-database-01" {
#   name      = var.mssqldatabase_name
#   server_id = azurerm_mssql_server.sql-server-01.id
# }
