#-- to maintain state
terraform {
  backend "azurerm" {}
  required_version = ">= 0.13"
}

resource "random_uuid" "uuid" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-hello-tf-${random_uuid.uuid.result}"
  location = var.location
}