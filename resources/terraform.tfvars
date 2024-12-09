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
mssqldatabase_name = "debasis-project-mssql-db-01"

# For Azure Container Registry
acr_name = "debacrregistry"
acr_sku  = "Basic"

# For Azure App Service Service Plan
app_service_service_plan_name = "deb-app-plan-01"

# For Azure App Service
app_service_name       = "deb-webpage"
app_service_image_url  = "https://debacrregistry.azurecr.io"
app_service_image_name = "project-work:v1.0.0"