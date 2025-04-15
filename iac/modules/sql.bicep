param location string
param environment string
param administratorLogin string

var keyVault = resource(keyVaultName, 'Microsoft.KeyVault/vaults@2021-10-01')

@secure()
param administratorPassword string = keyVault.getSecret(secretName)

resource sqlServer 'Microsoft.Sql/servers@2022-02-01-preview' = {
  name: 'sql-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorPassword
    version: '12.0'
  }
}

resource sqlDb 'Microsoft.Sql/servers/databases@2022-02-01-preview' = {
  name: '${sqlServer.name}/myappdb'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 2147483648
    sampleName: 'AdventureWorksLT'
  }
  sku: {
    name: 'S0'
    tier: 'Standard'
  }
}
