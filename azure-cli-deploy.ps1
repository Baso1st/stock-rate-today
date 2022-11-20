
$resourceGroupName = "StockRateToday"

az group create `
    --name $resourceGroupName `
    --location "East US 2"


$templateFile="./azuredeploy.json"

az deployment group create `
  --name deploymentName `
  --resource-group $resourceGroupName `
  --template-file $templateFile `
