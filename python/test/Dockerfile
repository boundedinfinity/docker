FROM python-pip:1.0
MAINTAINER brad

RUN mkdir /app
COPY requirements.txt /app/requirements.txt
RUN cd /app && pip install -r requirements.txt
