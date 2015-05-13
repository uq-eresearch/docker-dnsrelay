FROM debian:8
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au>

ENV DEBIAN_FRONTEND=noninteractive

RUN sed -i 's/httpredir.debian.org/mirror.aarnet.edu.au\/pub/' /etc/apt/sources.list && \
  apt-get update && apt-get install -y --no-install-recommends bind9 && apt-get clean

ADD /opt/run.sh /opt/run.sh

EXPOSE 53

ENTRYPOINT ["/opt/run.sh"]
