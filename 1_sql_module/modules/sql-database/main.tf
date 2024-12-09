# MS SQL DATABASE
resource "azurerm_mssql_database" "sql-database-01" {
  name        = var.mssqldatabase_name
  server_id   = var.sql_db_server_id
  collation   = var.sql_db_server_collation
  max_size_gb = var.sql_db_server_gb_size

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = var.sql_db_server_delete_prev
  }
}