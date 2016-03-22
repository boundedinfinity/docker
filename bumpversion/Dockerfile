FROM boundedinfinity/python-pip:1.0.0
MAINTAINER brad.babb@boundedinfinity.com

ENV SRC_DIR=/src
ENV APP_DIR=/app

RUN mkdir -p $SRC_DIR
COPY . $SRC_DIR

WORKDIR $SRC_DIR

RUN pip install -r Pipfile

WORKDIR $APP_DIR
