FROM alpine:3.1
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au>

RUN apk add --update bind && rm -rf /var/cache/apk/*

ADD /opt/run.sh /opt/run.sh

EXPOSE 53

ENTRYPOINT ["/opt/run.sh"]
