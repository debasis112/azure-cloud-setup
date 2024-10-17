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

variable "AZ_ACR_SPN_CLIENT_ID" {
  type    = string
  default = ""
}

variable "AZ_ACR_SPN_CLIENT_SECRET" {
  type      = string
  default   = ""
  sensitive = true
}

variable "AZ_ACR_SPN_TENANT_ID" {
  type    = string
  default = ""
}

variable "rg_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

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

variable "mssqldatabase_name" {
  type    = string
  default = ""
}