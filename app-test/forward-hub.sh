
# kubectl port-forward \
# $(kubectl get pods --all-namespaces|grep selenium-hub|awk '{print $2}') \
# 4444:4444

kubectl port-forward service/selenium-hub 4444:4444
# kubectl port-forward deployment.apps/hello-python 5000:5000

# LoadBalancer
# minikube service selenium-hub --url
# kubectl proxy --port=8080
