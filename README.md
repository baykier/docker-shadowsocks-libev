# docker-shadowsocks-libev

[![](https://travis-ci.org/lostsnow/docker-shadowsocks-libev.svg)](https://travis-ci.org/lostsnow/docker-shadowsocks-libev)

Current version: [2.6.1][1]

## docker image

See [lostsnow/shadowsocks-libev][2]

## Usage

change some environment variables in [docker-compose.yml][3].

```bash
# server
docker-compose up -d server

# client
docker-compose up -d client

# usage
curl -x socks5h://<client-ip>:1080 https://www.google.com/
```

[1]: https://github.com/shadowsocks/shadowsocks-libev/releases
[2]: https://hub.docker.com/r/lostsnow/shadowsocks-libev/
[3]: https://github.com/lostsnow/docker-shadowsocks-libev/blob/master/docker-compose.yml

##chrome 代理设置

1. 安装SwitchyOmega，[下载地址](https://github.com/FelisCatus/SwitchyOmega/releases/download/v2.3.21/SwitchyOmega.crx)
或者参考项目地址[https://github.com/FelisCatus/SwitchyOmega](https://github.com/FelisCatus/SwitchyOmega)安装，还可以直接安装
**SwitchyOmega-2.3.21.crx**

2. 设置pac模式:参考文档 **https://github.com/FelisCatus/SwitchyOmega/wiki/GFWList**

