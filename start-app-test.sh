
docker build -f app-test/Dockerfile -t hello-python:latest .

docker tag hello-python junqueira/hello-python-test
docker push junqueira/hello-python-test


kubectl create --filename=app-test/app-deployment.yaml
