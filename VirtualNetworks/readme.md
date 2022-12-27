# Hub VNet

This template deploys a standardized Network setup to use as a HUB in the Hub and spoke model, If you use a VPN Gateway (manual setup) recommended Subnet is 10.100.0.0/24

VNet-Hub-CoreServices-WestEurope 10.100.0.0/21
* WANSubnet 10.100.1.0/24
* LANSubnet 10.100.2.0/24
* IdentitySubnet 10.100.3.0/24
* StorageSubnet 10.100.4.0/24

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FVirtualNetworks%2FVNet-Hub-Networking%2Ftemplate.json)
