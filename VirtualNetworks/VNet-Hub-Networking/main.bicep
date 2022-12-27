@description('VNet name')
param vnetName1 string = 'VNet-Hub-Coreservices-WestEurope'

@description('Address prefix')
param vnetAddressPrefix1 string = '10.100.0.0/21'

@description('Subnet Prefix')
param subnet1Prefix string = '10.100.1.0/24'
param subnet2Prefix string = '10.100.2.0/24'
param subnet3Prefix string = '10.100.3.0/24'
param subnet4Prefix string = '10.100.4.0/24'

@description('Subnet Name')
param subnet1Name string = 'WANSubnet'
param subnet2Name string = 'LANSubnet'
param subnet3Name string = 'IdentitySubnet'
param subnet4Name string = 'StorageSubnet'

@description('Location for all resources.')
param location string = resourceGroup().location

resource vnet 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: vnetName1
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix1
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: subnet1Prefix
        }
      }
      {
        name: subnet2Name
        properties: {
          addressPrefix: subnet2Prefix
        }
      }
      {
        name: subnet3Name
        properties: {
          addressPrefix: subnet3Prefix
        }
      }
      {
        name: subnet4Name
        properties: {
          addressPrefix: subnet4Prefix
        }
      }
    ]
  }
}
