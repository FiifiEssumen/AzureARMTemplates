terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

//Comment code 
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

//Comment code 
resource "azurerm_virtual_network" "vnet" {
  name                = "myVNet"
  address_space       = ["10.0.0.0/16"]
  location            = "eastus"
  resource_group_name = "rg_eastus_172407_1_173903587061"
}


//Commment code 
resource "azurerm_subnet" "subnet" {
  name                 = "mySubnet"
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}


//Open bash terminal and upload terraform file
//enter terraform init"to initialize the terraform file
//terraform apply --auto-approve