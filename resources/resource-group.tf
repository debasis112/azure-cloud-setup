# Define Resource group Creation
resource "azurerm_resource_group" "rsg-01" {
  name     = var.rg_name
  location = var.location # or "South India" or "West India"
  tags     = local.common_tags
}
