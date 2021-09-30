# syntax=docker/dockerfile:1
FROM python:3.7-alpine

#setting docker workdir
WORKDIR /code

#setting required environment variables
ENV REDIS_HOST="172.19.0.3"
ENV REDIS_PORT="6379"

#install additional OS packages
#RUN apk add --no-cache gcc musl-dev linux-headers

#install software in versions declared in requirements file
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

#exposing port
EXPOSE 8000

#copy our file tree into the docker image WORKDIR
COPY . .

#running web server with 4 workers
CMD ["gunicorn", "-w 4", "-b", "0.0.0.0:8000", "main:app"]
