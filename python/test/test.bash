#!/usr/bin/env bash

docker build --tag python-pip-test:1.0 .
docker run --rm -it python-pip-test:1.0 bash
