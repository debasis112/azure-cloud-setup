resource "azurerm_mssql_database" "sql-database-01" {
  name         = var.mssqldatabase_name
  server_id    = azurerm_mssql_server.sql-server-01.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  // license_type = "LicenseIncluded"
  max_size_gb  = 32

  tags = local.common_tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}
//
// Database firewall rule-01
resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
  name             = "personal-asset-01"
  server_id        = azurerm_mssql_server.sql-server-01.id
  start_ip_address = "192.168.103.19"
  end_ip_address   = "192.168.103.19"
}