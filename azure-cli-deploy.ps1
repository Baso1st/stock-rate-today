# Login to Azure using Service Principal credentials from Github Secrets
Write-Output "Logging in to Azure with a service principal..."

az login `
    --service-principal `
    --username $Env:SP_CLIENT_ID `
    --password $Env:SP_CLIENT_SECRET `
    --tenant $Env:SP_TENANT_ID

Write-Output "Setting Subscription Name..."

az account set `
    --subscription $Env:AZURE_SUBSCRIPTION_NAME


Write-Output "Create Resource Group..."

$resourceGroupName = "StockRateToday"

az group create `
    --name $resourceGroupName `
    --location "East US 2"


Write-Output "Creating Resources..."

$templateFile="./azuredeploy.json"

az deployment group create `
  --name deploymentName `
  --resource-group $resourceGroupName `
  --template-file $templateFile `

Write-Output "End of Powershell Script..."