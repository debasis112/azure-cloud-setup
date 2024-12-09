# # Define ARC for image store
module "acr-01" {
  source            = "./modules/acr"
  acr_name          = var.acr_name
  rg_name           = var.rg_name
  location          = var.rg_location
  acr_sku           = var.acr_sku
  acr_admin_enabled = var.acr_admin_enabled
  tags              = var.tags
}