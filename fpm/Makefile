makefile_dir := $(abspath $(shell pwd))

docker_service  := fpm
docker_tag		  := $(shell cat $(makefile_dir)/docker-compose.yml | shyaml get-value services.$(docker_service).image)

.PHONY: list docker-build docker-run docker-push docker-dev

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort

docker-tag:
	@echo $(docker_tag)

docker-up:
	docker-compose up $(docker_service)

docker-stop:
	docker-compose stop $(docker_service)

docker-build:
	docker-compose build $(docker_service)

docker-bash:
	docker-compose run --rm $(docker_service) bash

docker-dev:
	docker-compose -f $(makefile_dir)/docker-compose-dev.yml run --rm $(docker_service) bash

docker-push:
	docker push $(docker_tag)

fpm-help:
ifeq ($(wildcard /.dockerenv),) # outside container
	@docker-compose run --rm $(docker_service) make fpm-help
else
	fpm --help
endif

fpm:
ifeq ($(wildcard /.dockerenv),) # outside container
	@docker-compose run --rm $(docker_service) make fpm args=$(args)
else
	cd /dist && fpm $(args)
endif
