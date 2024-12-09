# Define Resource group Creation
resource "azurerm_resource_group" "rsg-01" {
  name     = var.name
  location = var.location # or "South India" or "West India"
}
