#!/usr/bin/env bash

docker build --tag perl-carton-test:1.0 .
docker run --rm -it perl-carton-test:1.0 bash
