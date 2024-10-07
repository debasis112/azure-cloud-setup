terraform {
  required_version = "~> 1.9.5"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.2.2"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.53.1"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.4.0"
    }
  }
}
