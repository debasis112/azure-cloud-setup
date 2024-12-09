# Define MS SQL DATABASE Firewall
resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
  name             = var.sql_db_fw_name
  server_id        = var.sql_db_fw_server_id
  start_ip_address = var.sql_db_fw_start_ip_add
  end_ip_address   = var.sql_db_fw_end_ip_add
}
