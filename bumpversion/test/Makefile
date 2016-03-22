makefile_dir 	:= $(abspath $(shell pwd))

docker_group 	:= boundedinfinity
docker_image	:= bumpversion
docker_ver 		:= 1.0.0
docker_tag 		:= $(docker_group)/$(docker_image):$(docker_ver)

app_dir 		:= /app

config_file 	:= $(makefile_dir)/.bumpversion.cfg
config_orig		:= $(makefile_dir)/.bumpversion.cfg.orig

version_file 	:= $(makefile_dir)/version.txt
version_orig	:= $(makefile_dir)/version.txt.orig

.PHONY: list docker-build docker-run docker-push docker-dev

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort

docker-dev:
	docker run -v $(makefile_dir):$(app_dir) -it --rm $(docker_tag) bash

bumpversion-reset:
	rm -rf $(version_file) && cp $(version_orig) $(version_file)
	rm -rf $(config_file) && cp $(config_orig) $(config_file)

bumpversion-major: bumpversion-reset
	docker run -v $(makefile_dir):$(app_dir) -it --rm $(docker_tag) bash -c "bumpversion major"

bumpversion-minor: bumpversion-reset
	docker run -v $(makefile_dir):$(app_dir) -it --rm $(docker_tag) bash -c "bumpversion minor"

bumpversion-patch: bumpversion-reset
	docker run -v $(makefile_dir):$(app_dir) -it --rm $(docker_tag) bash -c "bumpversion patch"
