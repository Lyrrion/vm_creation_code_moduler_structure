terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Backend_RG_2025"
    storage_account_name = "backendstg202516"      # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "mybackendforvm"        # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.

  }
}

provider "azurerm" {

  features {}
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id

}

