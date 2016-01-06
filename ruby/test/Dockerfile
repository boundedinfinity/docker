FROM ruby-bundler:1.0
MAINTAINER brad

RUN mkdir /app
COPY Gemfile /app/Gemfile
RUN cd /app && bundle install
