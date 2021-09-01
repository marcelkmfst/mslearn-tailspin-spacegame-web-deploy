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

  az webapp list \
  --resource-group $resourcegroup \
  --query "[].{hostName: defaultHostName, state: state}" \
  --output table

  HostName                                      State
--------------------------------------------  -------
tailspin-web-staging-15151.azurewebsites.net  Running
tailspin-web-dev-15151.azurewebsites.net      Running
tailspin-web-test-15151.azurewebsites.net     Running
