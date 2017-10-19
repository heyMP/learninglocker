SHELL := /usr/bin/env bash

start:
	docker-compose build
	docker-compose up

clean:
	docker-compose rm
	docker volume prune

rebuild:
	docker-compose rm
	docker volume prune
	docker-compose build
	docker-compose up