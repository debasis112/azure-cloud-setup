# App Service - Host Web Pages from ACR
resource "azurerm_linux_web_app" "app-service-01" {
  name                = "deb-webpage" # Change this to your desired app name
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_service_plan.asp-01.location
  service_plan_id     = azurerm_service_plan.asp-01.id
  https_only          = true

  site_config {
    always_on = false
  }

  app_settings = {
    # Correctly setting the ACR connection details
    "docker_registry_url"      = "DOCKER|${azurerm_container_registry.acr.login_server}"
    "docker_image"             = "project-work:v1.0.0"
    "docker_registry_username" = azurerm_container_registry.acr.admin_username
    "docker_registry_password" = azurerm_container_registry.acr.admin_password
  }

  identity {
    type = "SystemAssigned"  # Enable Managed Identity if necessary
  }

  tags       = local.common_tags
}

# Output the App Service URL
output "app_service_url" {
  value = azurerm_linux_web_app.app-service-01.default_hostname
}
