# Get the id of the service principal configured for AKS
$AKS_RESOURCE_GROUP = "KEDA"
$AKS_CLUSTER_NAME = "KEDA"
$CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)
 
# Get the ACR registry resource id
$ACR_NAME = "kedainno"
$ACR_RESOURCE_GROUP = "KEDA"
$ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)
 
#Create role assignment
az role assignment create --assignee $CLIENT_ID --role Reader --scope $ACR_ID


