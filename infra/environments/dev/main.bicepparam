using '../../main.bicep'

param environment = 'dev'
param location = 'uksouth'
param storageAccountName = 'stgbiceplabdev01'
param fileShareName = 'clientfiles'
param fileShareQuota = 200
param storageSku = 'Standard_LRS'
