APP_NAME=bacnh85/quectel-sc20-linux

build:
	docker build docker-image -t ${APP_NAME}

public:
	docker push ${APP_NAME}

test:
	docker-compose up -d
	docker exec -it -u 1000 quectel-sc20-linux /bin/bash