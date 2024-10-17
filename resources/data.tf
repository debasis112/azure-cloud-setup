# data "azurerm_resource_group" "rsg-01" {
#   name = azurerm_resource_group.rsg-01.name
# }

# data "azurerm_mssql_server" "sql-server-01" {
#   name                = azurerm_mssql_server.sql-server-01.name
#   resource_group_name = data.azurerm_resource_group.rsg-01.name
# }

# data "azurerm_mssql_database" "sql-database-01" {
#   name      = azurerm_mssql_database.sql-database-01.name
#   server_id = azurerm_mssql_server.sql-server-01.id
# }

data "azurerm_container_registry_token" "token_acr" {
  name                    = "debacrregistry"
  resource_group_name     = azurerm_resource_group.rsg-01.name
  container_registry_name = azurerm_container_registry.acr.name
}

