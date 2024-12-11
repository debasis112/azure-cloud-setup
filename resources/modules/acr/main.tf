# Define ARC for image store
# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = var.rg_name
#   location            = var.location
#   sku                 = var.acr_sku
#   admin_enabled       = var.acr_admin_enabled
#   tags                = {}
# }

resource "azurerm_container_registry" "acr" {
  count               = var.acr_count
  name                = "${var.acr_name_prifix}${var.acr_name}${count.index+1}"  # Dynamically change name based on count
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = var.acr_admin_enabled
  tags                = var.tags
}
