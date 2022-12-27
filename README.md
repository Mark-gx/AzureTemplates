## Introduction
To greatly increase standardization across deployed Azure Services and speed up the deployment time for hub networks and the associated resources i have created a few templates to help with this. In this repository i will maintain and improve a (public) version of these templates.

## Requirements:
1. Have a paid or trial azure subscription.
2. Have a resource group called "SharedServices-WestEurope" set up. (still have some hardlinks lingering around to fix)

## What are we bulding?
We are building the foundations of a HUB and SPOKE network. Hub and spoke networks greatly increase modularity of your environment by grouping together shared services such as NVA's (Firewall/Router), Domain Controllers, Storage Endpoints and ofcourse the option to centrally house VPN Gateways. 

Adding new Workloads in new VNets (Spokes) simply mean you have to deploy a route to point local/east-west traffic to the NVA Lan Nic, after that you can manage the network traffic via your firewall. This increases security and managebility.

I will add a "visio" drawing at a later date to visualize this.


# Templates (Deployables)

Deploy Hub VNet

Deploy NSGs

Deploy OPNsense NVA

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fdmauser%2Fopnazure%2Fmaster%2FARM%2Fmain.json%3F/uiFormDefinitionUri/https%3A%2F%2Fraw.githubusercontent.com%2Fdmauser%2Fopnazure%2Fmaster%2Fbicep%2FuiFormDefinition.json)

Deploy Storage Account(s)

Deploy Windows Server 2022 Azure Edition [Small Disk]
