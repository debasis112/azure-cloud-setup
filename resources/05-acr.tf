# # Define ARC for image store
# module "acr-01" {
#   source            = "./modules/acr"
#   acr_name          = var.acr_name
#   rg_name           = var.rg_name
#   location          = var.rg_location
#   acr_sku           = var.acr_sku
#   acr_admin_enabled = var.acr_admin_enabled
#   tags              = var.tags
# }

module "acr-01" {
  source            = "./modules/acr" # Path to the ACR module
  acr_count         = var.acr_count   # Pass the acr_count variable from the root
  acr_name          = var.acr_name    # Base name for ACR
  rg_name           = var.rg_name
  location          = var.rg_location
  acr_sku           = var.acr_sku
  acr_admin_enabled = var.acr_admin_enabled
  tags              = var.tags
}
