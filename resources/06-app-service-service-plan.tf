# Define the App service - Service Plan
resource "azurerm_service_plan" "asp-01" {
  name                = var.app_service_service_plan_name
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_resource_group.rsg-01.location
  os_type             = "Linux"
  sku_name            = "F1" # For free use F1, For Basic use B1, For High use P1v2
  tags                = local.common_tags
}