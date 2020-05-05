#!/bin/bash

docker build docker-image -t bacnh85/quectel-sc20-linux
docker-compose stop
docker-compose rm -v

# Start Docker
docker-compose up -d
docker exec -it -u $UID quectel-sc20-linux /bin/bash