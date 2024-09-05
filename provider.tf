terraform {
  required_version = ">= 0.13"

  cloud {
    organization = "Flashfoodco"

    workspaces {
      tags = ["app:observe"]
    }
  }

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">=2.52.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.86.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = var.prevent_rg_deletion
    }
  }
}

# Configure the Azure AD Provider
provider "azuread" {}
