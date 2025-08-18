echo "${KUBECONFIG}" | base64 -d > kubeconfig

export KUBECONFIG=kubeconfig

#deploying every deployment and services in the respective dirctories
# kubectl apply -f deployments/database-deployment.yaml
kubectl apply -f deployments/backend-deployment.yaml
kubectl apply -f deployments/frontend-deployment.yaml

kubectl apply -f services/

rm kubeconfig
