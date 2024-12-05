resource "azurerm_arc_machine" "arc-machine-01" {
  name                = "deb-arcmachine"
  resource_group_name = azurerm_resource_group.rsg-01.name
  location            = azurerm_resource_group.rsg-01.location
  kind                = "SCVMM"
}