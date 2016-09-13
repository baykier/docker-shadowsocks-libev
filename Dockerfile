FROM alpine
MAINTAINER lostsnow <lostsnow@gmail.com>

ENV SS_VERSION 2.5.2
ENV SS_DOWNLOAD_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v${SS_VERSION}.tar.gz
ENV SS_DEPEND pcre
ENV SS_BUILD_DEPEND autoconf build-base curl libtool linux-headers openssl-dev asciidoc xmlto pcre-dev

RUN set -ex \
    && apk add --update ${SS_DEPEND} ${SS_BUILD_DEPEND} \
    && curl -sSL ${SS_DOWNLOAD_URL} | tar xz \
    && cd shadowsocks-libev-${SS_VERSION} \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf shadowsocks-libev-${SS_VERSION} \
    && apk del --purge ${SS_BUILD_DEPEND} \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8088
ENV PASSWORD=
ENV ENCRYPT_METHOD aes-256-cfb
ENV TIMEOUT 300
ENV DNS_RESOLVER 8.8.8.8
ENV DNS_RESOLVER2 8.8.4.4

EXPOSE ${SERVER_PORT}/tcp
EXPOSE ${SERVER_PORT}/udp

CMD /usr/local/bin/ss-server \
    -s ${SERVER_ADDR} \
    -p ${SERVER_PORT} \
    -m ${ENCRYPT_METHOD} \
    -k ${PASSWORD:-$(hostname)} \
    -t ${TIMEOUT} \
    -d ${DNS_RESOLVER} \
    -d ${DNS_RESOLVER2} \
    --fast-open -u -A
