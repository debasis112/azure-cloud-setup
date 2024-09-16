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

variable "mssqlserver_admin_name" {
  type    = string
  default = ""
}

variable "mssqlserver_admin_pass" {
  type    = string
  default = ""
}

variable "ad_admin_name" {
  type    = list(string)
  default = [] // Add , and other username from console for access
}

variable "ad_admin_obj_id" {
  type    = list(string)
  default = [] // Add , and other object ID from console for access
}