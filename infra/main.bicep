targetScope = 'resourceGroup'

@description('Environment name — used in tagging and naming.')
@allowed([
  'dev'
  'prod'
])
param environment string

@description('Azure region for deployment.')
param location string

@description('Globally unique storage account name.')
param storageAccountName string

@description('Name of the file share.')
param fileShareName string

@description('Quota for the file share in GiB.')
param fileShareQuota int

@description('Storage account SKU.')
param storageSku string

@description('Deployment timestamp — captured automatically.')
param deploymentTimestamp string = utcNow('yyyy-MM-dd')

var commonTags = {
  environment: environment
  managedBy: 'bicep'
  costCentre: 'IT-Lab'
  owner: 'stephen.meadowcroft'
  deployedAt: deploymentTimestamp
}

module storage 'modules/storage.bicep' = {
  name: 'storage-deployment'
  params: {
    location: location
    storageAccountName: storageAccountName
    fileShareName: fileShareName
    fileShareQuota: fileShareQuota
    storageSku: storageSku
    tags: commonTags
  }
}

output storageAccountId string = storage.outputs.storageAccountId
output storageAccountName string = storage.outputs.storageAccountName
output fileShareId string = storage.outputs.fileShareId
