# # MS SQL DATABASE
module "sql_db-01" {
  source                  = "./modules/sql-database" # Replace with the path to your module folder
  sql_db_name             = var.sql_db_name
  sql_db_server_id        = module.sql_server.sql_server_id
  sql_db_server_collation = var.sql_db_server_collation
  sql_db_server_gb_size   = var.sql_db_server_gb_size
  tags                    = var.tags
}
