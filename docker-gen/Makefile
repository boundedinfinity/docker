makefile_dir	:= $(abspath $(shell pwd))

fpm_image		:= boundedinfinity/fpm:1.0.0

docker_gen_url	:= https://github.com/jwilder/docker-gen/releases/download/0.7.3/docker-gen-linux-amd64-0.7.3.tar.gz
docker_gen_arc  := docker-gen-linux-amd64-0.7.3.tar.gz

dist_dir		:= $(makefile_dir)/dist
rpm_version		:= 1.0.0
rpm_name		:= docker-gen

.PHONY: list docker-build docker-run docker-push docker-dev

list:
	@grep '^[^#[:space:]].*:' Makefile | grep -v ':=' | grep -v '^\.' | sed 's/:.*//g' | tr -d ':' | sort


rpm-bootstrap:
	mkdir -p $(dist_dir) && \
	wget -O $(dist_dir)/$(docker_gen_arc) $(docker_gen_url) && \
	cd $(dist_dir) && \
	tar zxvf $(docker_gen_arc) && \
	rm -rf $(docker_gen_arc)

rpm:
	cd $(dist_dir) && \
	docker run --rm -v $(dist_dir):/dist $(fpm_image) \
	make fpm args="-s dir -t rpm -v $(rpm_version) -n $(rpm_name) /dist"
