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
  default     = {
    Environment = "Production"
    Department  = "cloud-computing"
    Owner       = "Debasis_Panda"
    Company     = "WIPRO"
    STD_ID      = "2020WA86256"
  }
}
