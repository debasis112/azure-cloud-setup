data "azurerm_resource_group" "rsg-01" {
  name = "debasis-project-rsg-01"
}

data "azurerm_mssql_server" "sql-server-01" {
  name                = "debasis-project-mssqlserver-01"
  resource_group_name = data.azurerm_resource_group.rsg-01.name
}
