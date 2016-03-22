makefile_dir := $(abspath $(shell pwd))

docker_tag 	:= redis:2
image_name 	:= redis

redis_cmd 	:= redis-cli -h "$$REDIS_PORT_6379_TCP_ADDR" -p "$$REDIS_PORT_6379_TCP_PORT"

.PHONY: list

export SHELL=/bin/bash 

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | sed 's/://g' | sort

redis-run:
	docker run --name $(image_name) -d $(docker_tag)

redis-cli:
	docker run -it --link $(image_name):redis --rm $(docker_tag) sh -c 'exec $(redis_cmd)'

redis-cli-keys:
	docker run -it --link $(image_name):redis --rm $(docker_tag) sh -c 'exec $(redis_cmd) keys *'	
