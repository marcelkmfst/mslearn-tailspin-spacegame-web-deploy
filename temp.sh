temp
resourcegroup=rg-multistagecicd
plan=tailspin-all-stages-asp 

az webapp create \
  --name tailspin-web-dev-$webappsuffix \
  --resource-group $resourcegroup \
  --plan $plan \
  --runtime "DOTNET|5.0"

az webapp create \
  --name tailspin-web-test-$webappsuffix \
  --resource-group $resourcegroup \
  --plan $plan \
  --runtime "DOTNET|5.0"

az webapp create \
  --name tailspin-web-staging-$webappsuffix \
  --resource-group $resourcegroup \
  --plan $plan \
  --runtime "DOTNET|5.0"