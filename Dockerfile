# The MIT License
#
# Copyright (c) 2021, Serhiy Makarenko

FROM debian:10-slim
LABEL maintainer="serhiy.makarenko@me.com"

ARG DEBIAN_FRONTEND=noninteractive

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests \
    apt-utils gnupg curl debian-keyring apt-transport-https ca-certificates && \
    c_rehash && \
    curl -1sLf 'https://packages.sury.org/bind/apt.gpg' | apt-key add - && \
    echo 'deb https://packages.sury.org/bind/ buster main' > /etc/apt/sources.list.d/isc-bind.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends --no-install-suggests bind9=1:9.16.15-1+0~20210429.45+debian10~1.gbpec5396 && \
    chown -R bind:bind /etc/bind && \
    apt-get purge -y --auto-remove apt-utils gnupg curl debian-keyring apt-transport-https ca-certificates && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/usr/sbin/named"]
CMD ["-c", "/etc/bind/named.conf", "-g", "-u", "bind"]
