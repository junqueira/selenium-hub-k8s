
docker build -f app-test/Dockerfile -t hello-python:latest app-test

docker tag hello-python junqueira/hello-python-test
docker push junqueira/hello-python-test


kubectl delete --filename=app-test/app-deployment.yaml
kubectl create --filename=app-test/app-deployment.yaml
