# For Resource group
rg_name     = "debasis-project-rsg-01"
rg_location = "Central India"

# Basic
tags = {
  Environment = "Production"
  Department  = "cloud-computing"
  Owner       = "Debasis_Panda"
  Company     = "WIPRO"
  STD_ID      = "2020WA86256"
}

# For MS SQL Server
mssqlserver_name = "debasis-project-mssqlserver-01"

# For MS SQL Database
sql_db_name             = "debasis-project-mssql-db-01"
sql_db_server_collation = "SQL_Latin1_General_CP1_CI_AS"
sql_db_server_gb_size   = 20

# For SQL server firewall
sql_db_fw_name = "Allow-all-pass"
sql_db_fw_start_ip_add = "0.0.0.0"
sql_db_fw_end_ip_add = "255.255.255.255"

# For Azure Container Registry
acr_name = "debacrregistry"
acr_sku  = "Basic"

# For Azure App Service Service Plan
app_service_service_plan_name = "deb-app-plan-01"

# For Azure App Service
app_service_name       = "deb-webpage"
app_service_image_url  = "https://debacrregistry.azurecr.io"
app_service_image_name = "project-work:v1.0.0"