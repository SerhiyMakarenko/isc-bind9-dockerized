# General
[![MIT License](https://img.shields.io/badge/License-MIT-blue.svg?style=flat)](https://github.com/SerhiyMakarenko/isc-bind9-dockerized/blob/isc-bind9/stable/LICENSE)

The Berkeley Internet Name Domain (BIND 9) implements an Internet domain name server. BIND 9 is the most widely-used name server software on the Internet, and is supported by the [Internet Software Consortium](www.isc.org).

This container provides the dockerized Internet Name Domain (BIND 9) implements an Internet domain name server using ISC maintained packages to compensate lag behind official ISC releases for Debian 10 (Buster).

# Usage
To run container you need to execute command listed below:
```
docker run -d --name bind9-server --net=host -v /path/to/named.conf:/etc/bind/named.conf -v /path/to/exemple.com.db:/etc/bind/exemple.com.db serhiymakarenko/isc-bind9:latest
```

# Related
- [Debian Repository Setup for BIND9](https://cloudsmith.io/~isc/repos/bind/packages/detail/deb/bind9/1:9.14.5-1+0~20190826.17+debian10~1.gbpeb8685/d=debian%252Fbuster/#install);
- [BIND9 packages maintened by ISC](https://cloudsmith.io/~isc/repos/bind/packages/?q=format%3Adeb).