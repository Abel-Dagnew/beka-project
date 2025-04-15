param location string
param environment string

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'stor${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountName string = storageAccount.name
