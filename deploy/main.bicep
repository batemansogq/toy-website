@description('The Azure region')
param location string = resourceGroup().location

@description('the name of the App Service')
param appServiceAppName string = 'toyweb-${uniqueString(resourceGroup().id)}'

@description('The envir type')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

@description('The name of the CosmosDB')
param cosmosDBAccountName string = 'toyweb-${uniqueString(resourceGroup().id)}'

module appService 'modules/app-service.bicep' = {
  name: 'app-service'
  params: {
    location: location
    environmentType: environmentType
    appServiceAppName: appServiceAppName
  }
}

module cosmosDB 'modules/cosmos-db.bicep' = {
  name: 'cosmos-db'
  params: {
    location: location
    environmentType: environmentType
    cosmosDBAccountName: cosmosDBAccountName
  }
}
