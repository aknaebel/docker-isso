FROM alpine:latest
MAINTAINER Alain Knaebel, <alain.knaebel@aknaebel.fr>

ENV ISSO_SETTINGS /opt/isso/isso.conf

RUN apk upgrade --update \
 && apk add python3 python3-dev sqlite gcc musl-dev ca-certificates openssl libffi-dev \
 && update-ca-certificates \
 && pip3 install isso gunicorn gevent \
 && mkdir -p /opt/isso \
 && wget -O /opt/isso/isso.conf https://raw.githubusercontent.com/posativ/isso/master/share/isso.conf

VOLUME /opt/issodb
VOLUME /opt/isso

EXPOSE 8080

CMD /usr/bin/gunicorn -k gevent -b 0.0.0.0:8080 -w 4 --preload isso.run
