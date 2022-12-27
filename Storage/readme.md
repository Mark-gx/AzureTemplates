# Azure Files Premium (FsLogix)

This template deploys a standardized Premium Performance Storage Account, often used for FsLogix

This template deploys the following:
* Storage account (files) optimized for FsLogix implementations, Premium LRS.
* Adjusts storage account minimum TLS Protocol to 1.2 instead of 1.0
* limits storage account name to 15 tokens to prevent Windows AD max character limit for computer accounts.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FStorage%2FDeployPremiumStorageLRS%2FStoragePremiumLRS.json)


# Azure Files Standardv2 (Regular shares)

This template deploys a standardized standard storage account v2, often used for regular fileshares.

This template deploys the following:
* Storage account v2 in the Hot Access tier.
* Adjusts storage account minimum TLS Protocol to 1.2 instead of 1.0
* limits storage account name to 15 tokens to prevent Windows AD max character limit for computer accounts.


Note: to get an azure transactional file share you still have to create it manually.


[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FMark-gx%2FAzureTemplates%2Fmain%2FStorage%2FDeployStandardHotLRS%2FDeployStoragev2HotLRS.json)
