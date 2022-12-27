@description('Azure region of the deployment')
param location string = resourceGroup().location

@description('Name of the network security group')
param nsgName1 string = 'NSG-IdentitySubnet'
param nsgName2 string = 'NSG-StorageSubnet'

resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: nsgName1
  location: location
}

resource nsg2 'Microsoft.Network/networkSecurityGroups@2022-01-01' = {
  name: nsgName2
  location: location
}
