echo "${KUBECONFIG}" | base64 -d > kubeconfig
export KUBECONFIG=kubeconfig

#Start by testing, whether the nodes and Frontend service are present
if kubectl get node && kubectl get service frontend; then
    #greps the external-IP from node
    ADDRESS=$(kubectl get node -o yaml | grep addresses: -A 8 | head -4 | tail -1 | cut -d: -f2 | tr -d ' ') 
    #greps the port from frontend service
    PORT=$(kubectl get services | grep frontend | cut -d: -f2 - | cut -d/ -f1 -) 
    URL="$ADDRESS:$PORT"

    if curl -fsS "$URL"; then
        echo "Testing availability: Successful"
        exit 0
    else
        echo "Testing availability: Failing to connect"
        exit 1
    fi 
else
    echo "No nodes or services were found"
fi

rm kubeconfig
