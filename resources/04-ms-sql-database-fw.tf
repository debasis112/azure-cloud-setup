# # Define MS SQL DATABASE Firewall
# resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
#   name             = "AllowAppService"
#   server_id        = azurerm_mssql_server.sql-server-01.id
#   start_ip_address = "0.0.0.0"
#   end_ip_address   = "255.255.255.255"
# }