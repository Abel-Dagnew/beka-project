terraform {
  backend "azurerm" {
    resource_group_name  = "abel_RG"
    storage_account_name = "terraformnew1"  # Replace with your actual storage account name
    container_name       = "tfstate"
    key                  = "terraform.tfstate"  # The blob name in the container
  }
}
