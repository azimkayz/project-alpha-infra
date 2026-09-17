terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-omni-tech-tfstate"
    storage_account_name = "omnitechtfstate"
    container_name       = "tfstate"
    key                  = "project-alpha.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}