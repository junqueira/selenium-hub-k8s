
kubectl delete --filename=k8s/selenium-hub-deployment.yaml
kubectl create --filename=k8s/selenium-hub-deployment.yaml

kubectl delete --filename=k8s/selenium-hub-svc.yaml
kubectl create --filename=k8s/selenium-hub-svc.yaml

kubectl delete --filename=k8s/selenium-node-chrome-deployment.yaml
kubectl create --filename=k8s/selenium-node-chrome-deployment.yaml
# kubectl delete --filename=k8s/selenium-node-firefox-deployment.yaml
# kubectl create --filename=k8s/selenium-node-firefox-deployment.yaml