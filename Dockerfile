FROM alpine
MAINTAINER lostsnow <lostsnow@gmail.com>

ENV SS_VERSION 2.4.6
ENV SS_DOWNLOAD_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v${SS_VERSION}.tar.gz
ENV SS_DEPEND autoconf build-base curl libtool linux-headers openssl-dev

RUN set -ex \
    && apk add --update ${SS_DEPEND} \
    && curl -sSL ${SS_DOWNLOAD_URL} | tar xz \
    && cd shadowsocks-libev-${SS_VERSION} \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf shadowsocks-libev-${SS_VERSION} \
    && apk del --purge ${SS_DEPEND} \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8088
ENV PASSWORD=
ENV ENCRYPT_METHOD aes-256-cfb
ENV TIMEOUT 300
ENV DNS_RESOLVER 8.8.8.8

EXPOSE ${SERVER_PORT}/tcp
EXPOSE ${SERVER_PORT}/udp

ENTRYPOINT ["/usr/local/bin/ss-server"]
