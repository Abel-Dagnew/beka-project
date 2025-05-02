# main.tf
provider "azurerm" {
  features {}
}

module "Create_App_Service" {
  source = "./Create_App_Service"
}
