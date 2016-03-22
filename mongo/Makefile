makefile_dir := $(abspath $(shell pwd))

docker_tag 		:= mongo:3
image_name 		:= mongo

mongod_port 	:= 27017
mongohttp_port 	:= 28017

cmd 	 	:= mongo "$$MONGO_PORT_27017_TCP_ADDR:$$MONGO_PORT_27017_TCP_PORT/test"

.PHONY: list

export SHELL=/bin/bash 

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | sed 's/://g' | sort

docker-cli:
	docker run -it --link $(image_name):mongo --rm $(docker_tag) sh -c 'bash'

mongo-run:
	docker run --name $(image_name) -p $(mongod_port):27017 -p $(mongohttp_port):28017 -d $(docker_tag)

mongo-cli:
	docker run -it --link $(image_name):mongo --rm $(docker_tag) sh -c 'exec $(cmd)'
