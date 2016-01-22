FROM java:openjdk-8u66-jdk
MAINTAINER brad.babb@boundedinfinity.com

ENV version=1.3.7
ENV zip=typesafe-activator-$version.zip
ENV url=https://downloads.typesafe.com/typesafe-activator/$version/$zip

ENV PATH=$PATH:/activator-dist-$version

RUN echo $url && echo $zip && \
    cd /tmp && \
    wget --quiet $url && \
    unzip -q -d / /tmp/$zip
