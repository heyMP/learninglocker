SHELL := /usr/bin/env bash

start:
	docker-compose build
	docker-compose up

# Remove ANY containers and volumes associated with this compose-up.
clean:
	docker-compose down --remove-orphans -v

# For development. VERY DESTRUCTIVE!
rebuild:
	make clean
	make start

top:
	docker-compose top

create-admin:
	docker-compose exec ll-api node cli/dist/server createSiteAdmin mgp140@gmail.com elmsln root