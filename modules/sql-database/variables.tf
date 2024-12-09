variable "mssqldatabase_name" {
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
  type        = string
  default     = true
}

variable "sql_db_server_delete_prev" {
  description = "The delete prevention of the MSSQL Server Database."
  type        = bool
  default     = true
}