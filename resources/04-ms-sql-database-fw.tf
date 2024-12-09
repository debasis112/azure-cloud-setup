# Define MS SQL DATABASE Firewall
# module "sql_db-fw-01" {
#   source                 = "./modules/sql-database-fw" # Replace with the path to your module folder
#   sql_db_fw_name         = var.sql_db_fw_name
#   sql_db_fw_server_id    = module.sql_server.sql_server_id
#   sql_db_fw_start_ip_add = var.sql_db_fw_start_ip_add
#   sql_db_fw_end_ip_add   = var.sql_db_fw_end_ip_add
# }