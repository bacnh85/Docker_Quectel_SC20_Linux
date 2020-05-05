#!/bin/sh

docker build docker-image -t bacnh85/quectel-sc20-linux


docker stop quectel-sc20-linux
docker rm quectel-sc20-linux -v

docker run -d --name quectel-sc20-linux -e UID=`id -u` -e GID=`id -g` -v "$(pwd)":/opt -v ~/.ssh:/home/${UID}/.ssh bacnh85/quectel-sc20-linux

docker exec -it -u $UID quectel-sc20-linux /bin/bash