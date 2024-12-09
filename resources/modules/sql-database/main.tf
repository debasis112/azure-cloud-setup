# MS SQL DATABASE
resource "azurerm_mssql_database" "sql-database-01" {
  name        = var.sql_db_name
  server_id   = var.sql_db_server_id
  collation   = var.sql_db_server_collation
  max_size_gb = var.sql_db_server_gb_size
  tags = {}
}
