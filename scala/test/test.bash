#!/usr/bin/env bash

docker build --tag scala-activator-test:1.0 .
docker run --rm -it scala-activator-test:1.0 bash
