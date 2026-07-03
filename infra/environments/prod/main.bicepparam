using '../../main.bicep'

param environment = 'prod'
param location = 'uksouth'
param storageAccountName = 'stgbiceplabprod01'
param fileShareName = 'clientfiles'
param fileShareQuota = 500
param storageSku = 'Standard_GRS'
