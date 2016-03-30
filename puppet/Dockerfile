FROM centos:7
MAINTAINER brad.babb@boundedinfinity.com

RUN yum install -y make gcc ruby-devel rubygems rubygem-bundler

ENV SRC_DIR=/src
RUN mkdir -p $SRC_DIR
WORKDIR $SRC_DIR
COPY . $SRC_DIR

RUN bundle install
