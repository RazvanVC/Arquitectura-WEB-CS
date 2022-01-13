#!/bin/sh
mvn clean package && docker build -t com.uah/PracticaFinal .
docker rm -f PracticaFinal || true && docker run -d -p 9080:9080 -p 9443:9443 --name PracticaFinal com.uah/PracticaFinal