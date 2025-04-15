param location string
param environment string
param storageAccountName string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'asp-${environment}'
  location: location
  sku: {
    name: 'P1v2'
    tier: 'PremiumV2'
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'webapp-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'STORAGE_ACCOUNT_NAME'
          value: storageAccountName
        }
      ]
    }
  }
}
