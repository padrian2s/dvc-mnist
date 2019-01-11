#!/bin/bash
set -e
CUSTOMER_NAME=qa
CUSTOMER_ENV=qa

CUSTOMER=$CUSTOMER_NAME-$CUSTOMER_ENV

VARIAN_RESOURCE_GROUP=VarianResourceGroup$CUSTOMER
VARIAN_K8S_NAME=AKSCluster$CUSTOMER

az group create --name $VARIAN_RESOURCE_GROUP --location eastus

az aks create \
    --resource-group $VARIAN_RESOURCE_GROUP \
    --name $VARIAN_K8S_NAME \
    --node-count 1 \
    --enable-addons monitoring \
    --generate-ssh-keys

#az aks install-cli

az aks get-credentials --resource-group $VARIAN_RESOURCE_GROUP --name $VARIAN_K8S_NAME

kubectl get nodes

