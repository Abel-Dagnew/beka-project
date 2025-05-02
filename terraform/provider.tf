# provider.tf
provider "azurerm" {
  features {}
  alias           = "azresourceprovider"
  client_id       = "6bcf0ae6-5132-4d66-a0ce-bf1ab6ea6abc"       
  client_secret   = "DPv8Q~moevoPlykXozEIuOZKYY6YdbKO6uqsJaMd"  
  tenant_id       = "16b3c013-d300-468d-ac64-7eda0820b6d3"      
  subscription_id = "6d9332c5-468f-4d90-937c-4eebe6e80f41"  
}
