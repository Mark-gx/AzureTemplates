# Introduction
To greatly increase standardization across deployed Azure Services and speed up the deployment time for hub networks and the associated resources i have created a few templates to help with this. In this repository i will maintain and improve a (public) version of these templates.

## Requirements:
1. Have a paid or trial azure subscription.
2. Have a resource group set up for your Hub / coreservices.

## What are we bulding?
We are building the foundations of a HUB and SPOKE network. Hub and spoke networks greatly increase modularity of your environment by grouping together shared services such as NVA's (Firewall/Router), Domain Controllers, Storage Endpoints and ofcourse the option to centrally house VPN Gateways. 

I will add a "visio" drawing at a later date to visualize this.


# Networking Templates
## Hub VNet

This template deploys a standardized Network setup to use as a HUB in the Hub and spoke model, If you use a VPN Gateway (manual setup) recommended Subnet is 10.100.0.0/24

This template deploys the following:
* VNet-Hub-CoreServices-WestEurope 10.100.0.0/21 (HUB VNET)
* WANSubnet 10.100.1.0/24
* LANSubnet 10.100.2.0/24
* IdentitySubnet 10.100.3.0/24
* StorageSubnet 10.100.4.0/24

WAN Subnet is for the NVA WAN/Untrusted NIC, LAN Subnet for the LAN/Trusted NIC, Identity Subnet for Windows ADC and Storage Subnet for (potential) private Storage Endpoints.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FVirtualNetworks%2FVNet-Hub-Networking%2Ftemplate.json)

## NSG Deployment

This template deploys 2 (unassociated) NSGs for the Identity and Storage Subnets. this is required to allow inter-vnet traversal once you deploy the NVA.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FVirtualNetworks%2FNSG-HUB-AI1%2FNsg.json)

## NVA Deployment

To deploy a NVA (Virtual Firewall/Router) visit my forked repo (Readme) from the OPNAzure project by DMauser: https://github.com/Mark-gx/opnazure, the 2 Nic deployment is best suited for this Hub Network.

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdmauser%2Fopnazure%2Fmaster%2FARM%2Fmain.json%3F/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fdmauser%2Fopnazure%2Fmaster%2Fbicep%2FuiFormDefinition.json)

# Storage Templates
## Azure Files Premium (FsLogix)

This template deploys a standardized Premium Performance Storage Account, often used for FsLogix

This template deploys the following:
* Storage account (files) optimized for FsLogix implementations, Premium LRS.
* Adjusts storage account minimum TLS Protocol to 1.2 instead of 1.0
* limits storage account name to 15 tokens to prevent Windows AD max character limit for computer accounts.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FStorage%2FDeployPremiumStorageLRS%2FStoragePremiumLRS.json)


## Azure Files Standardv2 (Regular shares)

This template deploys a standardized standard storage account v2, often used for regular fileshares.

This template deploys the following:
* Storage account v2 in the Hot Access tier.
* Adjusts storage account minimum TLS Protocol to 1.2 instead of 1.0
* limits storage account name to 15 tokens to prevent Windows AD max character limit for computer accounts.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FStorage%2FDeployStandardHotLRS%2FDeployStoragev2HotLRS.json)

# Compute Template
## Windows Server 2022 Azure Edition [Small Disk]

This template deploys a standardized config for a lightweight windows server, often used as Domain Controller in my environments. The custom Small Disk image still gives Premium SSD SLA and performance while saving about 15$ a month over the default 128GB P.SSD

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FCompute%2FServer2022SmallDisk%2FADC2022SmallDisk.json)

