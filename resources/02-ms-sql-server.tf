# # Create MS SQL server
# module "sql_server" {
#   source = "./modules/sql-server" # Update with the actual path to your module

#   sql_server_name                 = var.mssqlserver_name
#   sql_server_name_resg_name       = var.rg_name
#   sql_server_location             = var.rg_location
#   sql_server_version              = "12.0"
#   sql_server_admin_login          = var.mssqlserver_admin_name
#   sql_server_admin_login_password = var.mssqlserver_admin_pass
#   sql_server_minimum_tls_ver      = "1.2"

#   ad_admin_name   = var.ad_admin_name
#   ad_admin_obj_id = var.ad_admin_obj_id

#   tags = var.tags
# }

