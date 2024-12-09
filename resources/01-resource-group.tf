# # Define Resource group Creation
# resource "azurerm_resource_group" "rsg-01" {
#   name     = var.rg_name
#   location = var.location # or "South India" or "West India"
#   tags     = local.common_tags
# }

# module "rsg-01" {
#   source   = "./modules/resource-group"
#   name     = var.rg_name
#   location = var.rg_location
#   tags = {
#     Environment = "Production"
#     Department  = "cloud-computing"
#     Owner       = "Debasis_Panda"
#     Company     = "WIPRO"
#     STD_ID      = "2020WA86256"
#   }
# }

module "resource_group" {
  source   = "./modules/resource-group" # Replace with the path to your module folder
  name     = var.rg_name
  location = var.rg_location
  tags = {
    Environment = "Production"
    Department  = "cloud-computing"
    Owner       = "Debasis_Panda"
    Company     = "WIPRO"
    STD_ID      = "2020WA86256"
  }
}
