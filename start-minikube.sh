# install	
# sudo curl -Lo /usr/local/bin/minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \	
#   && sudo chmod +x /usr/local/bin/minikube

# # ls -lad $(type -a docker-machine-driver-hyperkit)
# curl -LO https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-hyperkit \	
# && sudo install -o root -g wheel -m 4755 docker-machine-driver-hyperkit /usr/local/bin/	

# windows
# minikube start --vm-driver hyperv --alsologtostderr -v=1
# minikube start --driver=hyperv --cpus=4 
# --memory=10192

# mac
# minikube start --alsologtostderr -v=8
minikube delete && \
minikube start --vm-driver hyperkit --cpus 4 --memory 6192

#addons
minikube addons enable ingress

# dash
minikube status
minikube dashboard