docker_group := bi
docker_image := ruby-bundler
docker_ver := 1.0
docker_tag := $(docker_group)/$(docker_image):$(docker_ver)

# export http_proxy=http://http-proxy.b.comcast.net:80
# export https_proxy=http://https-proxy.b.comcast.net:80
make_dir := $(abspath $(shell pwd))
app_dir := /app

.PHONY: list docker-build docker-run docker-push docker-dev

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort

docker-build:
	docker build --tag $(docker_tag) .

docker-bash:
	docker run -it --rm $(docker_tag) bash

docker-dev:
	docker run -it --rm -v $(make_dir):$(app_dir) $(docker_tag) bash

docker-push:
	docker push $(docker_tag)
