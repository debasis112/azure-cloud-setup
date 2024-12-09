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

module "sql_db-01" {
  source                  = "./modules/sql-database" # Replace with the path to your module folder
  sql_db_name             = var.sql_db_name
  sql_db_server_id        = module.sql_server-01.sql_server_id
  sql_db_server_collation = var.sql_db_server_collation
  sql_db_server_gb_size   = var.sql_db_server_gb_size
  tags                    = var.tags
}
