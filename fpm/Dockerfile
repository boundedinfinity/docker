FROM centos:7
MAINTAINER brad.babb@boundedinfinity.com

RUN yum install -y libffi-devel gcc make python-setuptools ruby-devel rubygems-devel rubygem-bundler rpm-build && \
    curl https://bootstrap.pypa.io/get-pip.py | python

ENV SRC_DIR /src
ENV DIST_DIR /dist

RUN mkdir -p $SRC_DIR
COPY . $SRC_DIR

WORKDIR $SRC_DIR

RUN pip install -r Pipfile
RUN bundle install
