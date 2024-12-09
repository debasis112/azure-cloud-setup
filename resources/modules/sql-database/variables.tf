variable "sql_db_name" {
  description = "The name of the MSSQL Server Database name."
  type        = string
  default     = ""
}

variable "sql_db_server_id" {
  description = "The name of the MSSQL Server."
  type        = string
}

variable "sql_db_server_collation" {
  description = "The collation of the MSSQL Server Database."
  type        = string
}

variable "sql_db_server_gb_size" {
  description = "The size of the MSSQL Server Database."
  type        = number
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}