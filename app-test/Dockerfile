FROM python:3.7

RUN mkdir /app

ADD . /app/
WORKDIR /app

ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

EXPOSE 5000
CMD ["python", "app.py"]