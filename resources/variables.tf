# For Basic Setup
variable "subscription_id" {
  type    = string
  default = ""
}

variable "client_id" {
  type    = string
  default = ""
}

variable "client_secret" {
  type    = string
  default = ""
}

variable "tenant_id" {
  type    = string
  default = ""
}

variable "tags" {
  description = "Tags for rsg"
  type        = map(any)
  default     = {}
}

# For Resource Group Setup
variable "rg_name" {
  type    = string
  default = ""
}

variable "rg_location" {
  type    = string
  default = ""
}



# For MS SQL server Setup
variable "mssqlserver_name" {
  type    = string
  default = ""
}

variable "mssqlserver_admin_name" {
  type    = string
  default = ""
}

variable "mssqlserver_admin_pass" {
  type    = string
  default = ""
}

variable "ad_admin_name" {
  type    = string
  default = ""
}

variable "ad_admin_obj_id" {
  type    = string
  default = ""
}

# For sql database
variable "sql_db_name" {
  type    = string
  default = ""
}

variable "sql_db_server_collation" {
  description = "The collation of the MSSQL Server Database."
  type        = string
}

variable "sql_db_server_gb_size" {
  description = "The size of the MSSQL Server Database."
  type        = number
  # default     = 20 # Optional default value
}

# SQl Server Firewall
variable "sql_db_fw_name" {
  description = "The name of the MSSQL Server."
  type        = string
}

variable "sql_db_fw_start_ip_add" {
  description = "The name of the MSSQL Server."
  type        = string
}

variable "sql_db_fw_end_ip_add" {
  description = "The name of the MSSQL Server."
  type        = string
}

# For ACR to pull Image
# variable "AZ_ACR_SPN_CLIENT_ID" {
#   type    = string
#   default = ""
# }

# variable "AZ_ACR_SPN_CLIENT_SECRET" {
#   type      = string
#   default   = ""
#   sensitive = true
# }

# variable "AZ_ACR_SPN_TENANT_ID" {
#   type    = string
#   default = ""
# }

# For ACR setup
variable "acr_name" {
  type    = string
  default = ""
}

variable "acr_sku" {
  type    = string
  default = ""
}

variable "acr_admin_enabled" {
  type        = bool
  default     = true
  description = "Default will be false, we use service principals it is used by App service."
}

# For App Service Service plan Setup
variable "app_service_service_plan_name" {
  type    = string
  default = ""
}

# For App Service Setup
variable "app_service_name" {
  type    = string
  default = ""
}


variable "app_service_website_storage" {
  type        = string
  default     = ""
  description = "Default will be false and we are not using storage for app service, so flase"
}

variable "app_service_image_url" {
  type    = string
  default = "false"
}

variable "app_service_image_name" {
  type    = string
  default = ""
}