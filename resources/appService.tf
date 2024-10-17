resource "azurerm_linux_web_app" "app-service-01" {
  name                = "deb-webpage"
  location            = azurerm_resource_group.rsg-01.location
  resource_group_name = azurerm_resource_group.rsg-01.name
  service_plan_id     = azurerm_service_plan.asp-01.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false" # Optional
  }

  site_config {
    always_on = true # Optional
    application_stack {
      docker_registry_url      = "https://debacrregistry.azurecr.io"
      docker_registry_username = azurerm_container_registry.acr.admin_username
      docker_registry_password = azurerm_container_registry.acr.admin_password
      docker_image_name        = "project-work:v1.0.0" # Specify the image here
    }
  }

  identity {
    type = "SystemAssigned" # Enable managed identity
  }

  tags = local.common_tags
}
