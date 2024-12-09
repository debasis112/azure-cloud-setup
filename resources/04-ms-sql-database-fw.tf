# # Define MS SQL DATABASE Firewall
# resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
#   name             = "AllowAppService"
#   server_id        = azurerm_mssql_server.sql-server-01.id
#   start_ip_address = "0.0.0.0"
#   end_ip_address   = "255.255.255.255"
# }

module "sql_db-01" {
  source                 = "./modules/sql-database-fw" # Replace with the path to your module folder
  sql_db_fw_name         = var.sql_db_fw_name
  sql_db_fw_server_id    = module.sql_server-01.sql_server_id
  sql_db_fw_start_ip_add = "0.0.0.0"
  sql_db_fw_end_ip_add   = "255.255.255.255"

}