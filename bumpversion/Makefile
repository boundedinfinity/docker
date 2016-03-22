makefile_dir 	:= $(abspath $(shell pwd))

docker_group 	:= boundedinfinity
docker_image 	:= bumpversion
docker_ver 		:= docker_ver.*:= 1.0.0
docker_tag 		:= $(docker_group)/$(docker_image):$(docker_ver)

bumpversion_tag	:= boundedinfinity/bumpversion:1.0.0

src_dir 		:= /src

.PHONY: list docker-build docker-run docker-push docker-dev

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort

docker-tag:
	@echo $(docker_tag)

docker-build:
	docker build --tag $(docker_tag) .

docker-clean-build:
    docker build --no-cache --force-rm --tag $(docker_tag) .

docker-bash:
	docker run -it --rm $(docker_tag) bash

docker-dev:
	docker run -it --rm -v $(makefile_dir):$(src_dir) $(docker_tag) bash

docker-push:
	docker push $(docker_tag)

bumpversion-major:
	docker run -it --rm -v $(makefile_dir):/app $(bumpversion_tag) bash -c "bumpversion major"

bumpversion-minor:
	docker run -it --rm -v $(makefile_dir):/app $(bumpversion_tag) bash -c "bumpversion minor"

bumpversion-patch:
	docker run -it --rm -v $(makefile_dir):/app $(bumpversion_tag) bash -c "bumpversion patch"

publish: bumpversion-patch

