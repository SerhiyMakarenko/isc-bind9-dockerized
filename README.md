# General
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/SerhiyMakarenko/isc-bind9-dockerized/blob/isc-bind9-dns-server/stable/LICENSE)

The Berkeley Internet Name Domain (BIND 9) implements an Internet domain name server. BIND 9 is the most widely-used name server software on the Internet, and is supported by the [Internet Software Consortium](www.isc.org).

This container provides the dockerized Internet Name Domain (BIND 9) implements an Internet domain name server using ISC maintained packages to compensate lag behind official ISC releases for Debian 10 (Buster).

# Details
Currently, the image supports the following CPU architectures:
 - x86_64 (amd64);
 - armhf (arm32v6);
 - arm7l (arm32v6);
 - aarch6 (arm64v8).

This means that the image can be used on regular PC's with Intel CPU as well as on single-board computers like Raspberry Pi with ARM CPU.

# Usage
To run container you need to execute command listed below:
```
docker run -d --name isc-bind9-dns-server --net=host \
    -v /path/to/named.conf:/etc/bind/named.conf \
    -v /path/to/exemple.com.db:/etc/bind/exemple.com.db \
    serhiymakarenko/isc-bind9-dns-server:latest
```

# Related
- [Debian Repository Setup for BIND9](https://bind.debian.net/bind/README.txt);
- [BIND9 packages maintened by ISC](https://bind.debian.net/bind/).
