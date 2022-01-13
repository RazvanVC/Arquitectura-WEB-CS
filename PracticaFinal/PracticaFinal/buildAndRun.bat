@echo off
call mvn clean package
call docker build -t com.uah/PracticaFinal .
call docker rm -f PracticaFinal
call docker run -d -p 9080:9080 -p 9443:9443 --name PracticaFinal com.uah/PracticaFinal