@description('The Azure region')
param location string

@description('The envir type')
@allowed([
  'nonprod'
  'prod'
])
param environmentType string

@description('The name of the App Service')
param appServiceAppName string

var appServicePlanName = 'toy-website-plan'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3': 'F1'
var appServicePlanTierName = (environmentType == 'prod') ? 'PremiumV3' : 'Free'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
    tier: appServicePlanTierName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
