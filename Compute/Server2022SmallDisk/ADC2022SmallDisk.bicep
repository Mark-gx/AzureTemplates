@description('Size of VM')
@allowed([
  'Standard_B2s'
  'Standard_B2ms'
  'Standard_B4ms'
  'Standard_D2as_v5'
  'Standard_D4as_v5'
])
param vmSize string = 'Standard_B2ms'

@description('Existing VNET that contains the domain controller')
param existingVnetName string = 'VNet-Hub-Coreservices-WestEurope'

@description('Public IP address name')
param publicIPAddressName string = '${dnsLabelPrefix}-pip'

@description('Existing subnet that contains the domain controller')
param existingSubnetName string = 'IdentitySubnet'

@description('Unique public DNS prefix for the deployment AND VM name.')
@minLength(1)
@maxLength(62)
param dnsLabelPrefix string

@description('The name of the administrator of the new VM.')
param adminUsername string = 'campaiadmin'

@description('The password for the administrator account of the new VM.')
@secure()
param adminPassword string

@description('Location for all resources.')
param location string = resourceGroup().location

var imagePublisher = 'MicrosoftWindowsServer'
var imageOffer = 'WindowsServer'
var windowsOSVersion = '2022-datacenter-azure-edition-smalldisk'
var nicName = '${dnsLabelPrefix}-nic'

resource existingVirtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' existing = {
  name: existingVnetName
}

resource existingSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-02-01' existing = {
  parent: existingVirtualNetwork
  name: existingSubnetName
}

resource publicIp 'Microsoft.Network/publicIPAddresses@2021-02-01' = {
  name: publicIPAddressName
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix
    }
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'dynamic'
          publicIPAddress: {
            id: publicIp.id
          }
          subnet: {
            id: existingSubnet.id
          }
        }
      }
    ]
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: dnsLabelPrefix
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: dnsLabelPrefix
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: windowsOSVersion
        version: 'latest'
      }
      osDisk: {
        name: '${dnsLabelPrefix}-OsDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: false
      }
    }
  }
}
