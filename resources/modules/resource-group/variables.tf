# For Resource Group Setup
variable "name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "tags" {
  description = "Tags for rsg"
  type        = map(any)
}
