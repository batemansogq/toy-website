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

module appService 'modules/app-service.bicep' = {
  name: 'app-service'
  params: {
    location: location
    environmentType: environmentType
    appServiceAppName: appServiceAppName
  }
}
