#!/bin/sh
echo "${KUBECONFIG}" | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

#deploying every deployment and services in the respective dirctories
kubectl apply -f deployments/
kubectl apply -f services/

rm kubeconfig
