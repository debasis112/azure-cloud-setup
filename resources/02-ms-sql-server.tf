# # MS SQL server
# resource "azurerm_mssql_server" "sql-server-01" {
#   name                         = var.mssqlserver_name
#   resource_group_name          = azurerm_resource_group.rsg-01.name
#   location                     = azurerm_resource_group.rsg-01.location
#   version                      = "12.0"
#   administrator_login          = var.mssqlserver_admin_name
#   administrator_login_password = var.mssqlserver_admin_pass
#   minimum_tls_version          = "1.2"

#   azuread_administrator {
#     login_username = var.ad_admin_name
#     object_id      = var.ad_admin_obj_id
#   }
#   tags = local.common_tags
# }
module "mssql_server" {
  source                  = "./modules/mssql_server"
  sql_server_name         = var.mssqlserver_name
  sql_server_resg_name    = azurerm_resource_group.rsg-01.name
  sql_server_location     = azurerm_resource_group.rsg-01.location
  sql_server_version      = "12.0"
  sql_server_admin_login  = var.mssqlserver_admin_name
  sql_server_admin_login_password = var.mssqlserver_admin_pass
  sql_server_minimum_tls_ver = "1.2"
  ad_admin_name           = var.ad_admin_name
  ad_admin_obj_id         = var.ad_admin_obj_id
  tags                    = local.common_tags
}
