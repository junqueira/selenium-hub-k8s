
#scrapy-book
kubectl delete --filename=k8s/scrapy-book/selenium-hub-deployment.yaml
kubectl create --filename=k8s/scrapy-book/selenium-hub-deployment.yaml

kubectl delete --filename=k8s/scrapy-book/selenium-hub-svc.yaml
kubectl create --filename=k8s/scrapy-book/selenium-hub-svc.yaml

kubectl delete --filename=k8s/scrapy-book/selenium-node-chrome-deployment.yaml
kubectl create --filename=k8s/scrapy-book/selenium-node-chrome-deployment.yaml
# kubectl delete --filename=k8s/scrapy-book/selenium-node-firefox-deployment.yaml
# kubectl create --filename=k8s/scrapy-book/selenium-node-firefox-deployment.yaml

# #scrapy-invest
# kubectl delete --filename=k8s/scrapy-invest/selenium-hub-deployment.yaml
# kubectl create --filename=k8s/scrapy-invest/selenium-hub-deployment.yaml

# kubectl delete --filename=k8s/scrapy-invest/selenium-hub-svc.yaml
# kubectl create --filename=k8s/scrapy-invest/selenium-hub-svc.yaml

# kubectl delete --filename=k8s/scrapy-invest/selenium-node-chrome-deployment.yaml
# kubectl create --filename=k8s/scrapy-invest/selenium-node-chrome-deployment.yaml

# #scrapy-order
# kubectl delete --filename=k8s/scrapy-order/selenium-hub-deployment.yaml
# kubectl create --filename=k8s/selenium-hub-deployment.yaml

# kubectl delete --filename=k8s/scrapy-order/selenium-hub-svc.yaml
# kubectl create --filename=k8s/scrapy-order/selenium-hub-svc.yaml

# kubectl delete --filename=k8s/scrapy-order/selenium-node-chrome-deployment.yaml
# kubectl create --filename=k8s/scrapy-order/selenium-node-chrome-deployment.yaml

# #scrapy-stop
# kubectl delete --filename=k8s/scrapy-stop/selenium-hub-deployment.yaml
# kubectl create --filename=k8s/scrapy-stop/selenium-hub-deployment.yaml

# kubectl delete --filename=k8s/scrapy-stop/selenium-hub-svc.yaml
# kubectl create --filename=k8s/selenium-hub-svc.yaml

# kubectl delete --filename=k8s/scrapy-stop/selenium-node-chrome-deployment.yaml
# kubectl create --filename=k8s/scrapy-stop/selenium-node-chrome-deployment.yaml