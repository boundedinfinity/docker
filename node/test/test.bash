#!/usr/bin/env bash

docker build --tag node-npm-test:1.0 .
docker run --rm -it node-npm-test:1.0 bash
