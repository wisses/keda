# To enable ssh & remote debugging on app service change the base image to the one below
# FROM mcr.microsoft.com/azure-functions/node:2.0-appservice
FROM mcr.microsoft.com/azure-functions/node:2.0-appservice

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true \
    AzureWebJobsStorage=DefaultEndpointsProtocol=https;AccountName=kedastoragequeueinno;AccountKey=CJ/uYvyE8YSqcBq537bLs4v5EyfWS5hwzWlZpVx74PHLnKiMzQi78VgB95nV8jZVr9LNwyI0gHW0ISU4DVvIQQ==;EndpointSuffix=core.windows.net

COPY . /home/site/wwwroot

RUN cd /home/site/wwwroot && \
    npm install