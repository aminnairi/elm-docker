.PHONY: start stop restart build

start:
	docker-compose up --detach --build

stop:
	docker-compose down --remove-orphans --volumes

restart: stop start
