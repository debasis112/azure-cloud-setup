# # MS SQL DATABASE
# resource "azurerm_mssql_database" "sql-database-01" {
#   name        = var.mssqldatabase_name
#   server_id   = azurerm_mssql_server.sql-server-01.id
#   collation   = "SQL_Latin1_General_CP1_CI_AS"
#   max_size_gb = 20

#   tags = local.common_tags

#   # prevent the possibility of accidental data loss
#   lifecycle {
#     prevent_destroy = true
#   }
# }