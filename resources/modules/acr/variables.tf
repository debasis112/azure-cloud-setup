# For ACR setup
variable "rg_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

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
  description = "Default will be false, we use service principals it is used by App service."
  default     =  true
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
}