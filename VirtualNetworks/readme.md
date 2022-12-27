# Hub VNet

This template deploys a standardized Network Hub for a NVA configuration, If you use a VPN Gateway recommended Subnet is 10.100.3.0/24

* VNet-Hub-Networking-WestEurope 10.100.0.0/20
* WANSubnet 10.100.0.0/24
* LANSubnet 10.100.1.0/24

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FVirtualNetworks%2FVNet-Hub-Networking%2Ftemplate.json)

# Core Service VNet (Spoke)
Deploy a standardized CoreServices Spoke, often used by Domain Controllers (VMs) and Storage Private Endpoints.

* VNet-Spoke-CoreServices-WestEurope 10.110.0.0/20
* IdentitySubnet 10.110.0.0/24
* StorageSubnet 10.110.1.0/24

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FVirtualNetworks%2FVNet-Spoke-CoreServices%2Fmain.json)
