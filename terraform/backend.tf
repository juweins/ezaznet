# Backend configuration for Terraform

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.63.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~>3.5.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0.0"
    }
  }
}