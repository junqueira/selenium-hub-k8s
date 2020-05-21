

# kubectl port-forward \
# $(kubectl get pods --all-namespaces|grep selenium-hub|awk '{print $2}') \
# 4444:4444

# kubectl proxy --port=8080

kubectl port-forward \
service/selenium-hub \
4444:4444
