variable "sql_server_name" {
  description = "The name of the MSSQL Server."
  type        = string
}

variable "sql_server_name_resg_name" {
  description = "The name of the resource group."
  type        = string
}

variable "sql_server_location" {
  description = "The location of the resource group."
  type        = string
}

variable "sql_server_version" {
  description = "The version of the MSSQL Server."
  type        = string
}

variable "sql_server_admin_login" {
  description = "The administrator login name for the server."
  type        = string
}

variable "sql_server_admin_login_password" {
  description = "The administrator login password for the server."
  type        = string
  sensitive   = true
}

variable "sql_server_minimum_tls_ver" {
  description = "The minimum TLS version for the server."
  type        = string
}

variable "ad_admin_name" {
  type    = string
  default = ""
}

variable "ad_admin_obj_id" {
  type    = string
  default = ""
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}

