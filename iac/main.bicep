targetScope = 'resourceGroup'

param location string
param environment string
param sqlAdminUsername string
@secure()
param sqlAdminPassword string
param administratorPassword string = '@Microsoft.KeyVault(SecretUri=https://sql-secret.vault.azure.net/secrets/abel-sql-secret/5ac6f15d73184eaeb61911f0bdfcc0e5)'

module storage 'modules/storage-account.bicep' = {
  name: 'storageDeploy'
  params: {
    location: location
    environment: environment
  }
}

module sql 'modules/sql.bicep' = {
  name: 'sqlDeploy'
  params: {
    location: location
    environment: environment
    administratorLogin: sqlAdminUsername
    administratorPassword: administratorPassword
  }
}

module appService 'modules/app-service.bicep' = {
  name: 'appServiceDeploy'
  params: {
    location: location
    environment: environment
    storageAccountName: storage.outputs.storageAccountName
  }
}
