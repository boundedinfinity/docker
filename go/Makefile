docker_group := boundedinfinity
docker_image := go-glide
docker_ver   := 1.0.0
docker_tag   := $(docker_group)/$(docker_image):$(docker_ver)

.PHONY: list docker-build docker-run docker-push

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | sed 's/://g' | sort

docker-tag:
	@echo $(docker_tag)

docker-build:
	docker build --tag $(docker_tag) .

docker-bash:
	docker run -it --rm $(docker_tag) bash

docker-push:
	docker push $(docker_tag)
