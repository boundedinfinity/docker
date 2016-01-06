FROM perl-carton:1.0
MAINTAINER brad

RUN mkdir /app
COPY cpanfile /app/cpanfile
RUN cd /app && carton install
