# The MIT License
#
# Copyright (c) 2019, Serhiy Makarenko

FROM debian:10-slim
MAINTAINER Serhiy Makarenko <serhiy@makarenko.me>

ARG DEBIAN_FRONTEND=noninteractive

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    apt-utils gnupg curl debian-keyring apt-transport-https ca-certificates && \
    curl -1sLf 'https://dl.cloudsmith.io/public/isc/bind/cfg/gpg/gpg.3C6A2C947E5E6D2E.key' | apt-key add - && \
    curl -1sLf 'https://dl.cloudsmith.io/public/isc/bind/cfg/setup/config.deb.txt?distro=debian&codename=buster' > /etc/apt/sources.list.d/isc-bind.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests bind9=1:9.14.5-1+0~20190826.17+debian10~1.gbpeb8685 && \
    apt-get purge -y --auto-remove --allow-remove-essential apt-utils gnupg curl debian-keyring apt-transport-https ca-certificates && \
    apt-get clean && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/usr/sbin/named"]
CMD ["-c", "/etc/bind/named.conf", "-g", "-u", "bind"]