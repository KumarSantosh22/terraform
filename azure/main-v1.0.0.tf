# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  cloud {
    organization = "ABCD"
    workspaces {
      name = "learn-terraform-azure"
    }
  }
  backend "azurerm" {
    resource_group_name = "terraform-rg"
    storage_account_name = "terraformrg"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "terraform_spike" {
  name     = "terraform-spike-01"
  location = "westeurope"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "terraform-network"
  resource_group_name = azurerm_resource_group.terraform_spike.name
  location            = azurerm_resource_group.terraform_spike.location
  address_space       = ["10.0.0.0/16"]
}
