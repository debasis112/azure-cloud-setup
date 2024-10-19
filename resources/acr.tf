# # Define ARC for image store
# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = azurerm_resource_group.rsg-01.name
#   location            = azurerm_resource_group.rsg-01.location
#   sku                 = var.acr_sku
#   admin_enabled       = var.acr_admin_enabled
#   tags                = local.common_tags
# }