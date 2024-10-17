# Define Resource group Creation
resource "azurerm_resource_group" "rsg-01" {
  name     = var.rg_name
  location = var.location # or "South India" or "West India"
  tags     = local.common_tags
}

# MS SQL server
resource "azurerm_mssql_server" "sql-server-01" {
  name                         = var.mssqlserver_name
  resource_group_name          = azurerm_resource_group.rsg-01.name
  location                     = azurerm_resource_group.rsg-01.location
  version                      = "12.0"
  administrator_login          = var.mssqlserver_admin_name
  administrator_login_password = var.mssqlserver_admin_pass
  minimum_tls_version          = "1.2"

  azuread_administrator {
    login_username = var.ad_admin_name
    object_id      = var.ad_admin_obj_id
  }
  tags = local.common_tags
}

# MS SQL DATABASE
resource "azurerm_mssql_database" "sql-database-01" {
  name        = var.mssqldatabase_name
  server_id   = azurerm_mssql_server.sql-server-01.id
  collation   = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb = 20

  tags = local.common_tags

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}

# Define MS SQL DATABASE Firewall
resource "azurerm_mssql_firewall_rule" "sql-database-fw-01" {
  name             = "AllowAppService"
  server_id        = azurerm_mssql_server.sql-server-01.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
}

# Define ARC for image store
resource "azurerm_container_registry" "acr" {
  name                = "debacrregistry"
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_resource_group.rsg-01.location
  sku                 = "Basic"
  admin_enabled       = true
  # Default will be false and we use service principals for more security it is used by App service.
  tags = local.common_tags
}

# Define the App service - Service Plan
resource "azurerm_service_plan" "asp-01" {
  name                = "deb-app-plan-01"
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_resource_group.rsg-01.location
  os_type             = "Linux"
  sku_name            = "F1" # For free use F1, For Basic use B1, For High use P1v2
  tags                = local.common_tags
}

# Define the App Service with Docker container in Linux
resource "azurerm_linux_web_app" "app-service-01" {
  name                = "deb-webpage" # Change this to your desired app name
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_service_plan.asp-01.location
  service_plan_id     = azurerm_service_plan.asp-01.id

  site_config {
    always_on = false
  }

  app_settings = {
    "WEBSITES_ENABLE_SERVICE_STORAGE" = "false"
    "docker_registry_url"             = "https://debacrregistry.azurecr.io"
    "docker_image"                    = "project-work:v1.0.0"
    "docker_registry_username"        = var.AZ_ACR_SPN_CLIENT_ID
    "docker_registry_password"        = var.AZ_ACR_SPN_CLIENT_SECRET
  }

  identity {
    type = "SystemAssigned"
  }

  https_only = true
  tags       = local.common_tags
}

# Define the App Service
resource "azurerm_linux_web_app" "app-service-01" {
  name                = "deb-webpage" # Change this to your desired app name
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_service_plan.asp-01.location
  service_plan_id     = azurerm_service_plan.asp-01.id

  site_config {
    linux_fx_version = "DOCKER|${azurerm_container_registry.acr.login_server}/project-work:v1.0.0"
  }

  app_settings = {
    "DOCKER_REGISTRY_SERVER_URL"      = "https://${azurerm_container_registry.acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME" = azurerm_container_registry.acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD" = azurerm_container_registry.acr.admin_password
  }

  identity {
    type = "SystemAssigned"
  }

  https_only = true
  tags       = local.common_tags
}
