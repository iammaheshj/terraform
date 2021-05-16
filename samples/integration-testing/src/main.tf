#-- to maintain state
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-state-test-rg"
    storage_account_name = "terraformstatetest2"
    container_name       = "tfstate"
    key                  = "terraform.state"
  }
  required_version = ">= 0.13"
}

resource "random_uuid" "uuid" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-hello-tf-${random_uuid.uuid.result}"
  location = var.location
}