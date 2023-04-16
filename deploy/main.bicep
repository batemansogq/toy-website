@description('The Azure region')
param location string = resourceGroup().location

@description('The envir type')
@allowed([
  'nonprod'
  'prod'
])

param environmentType string
