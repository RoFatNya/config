#!/usr/bin/env bash
#
#download

download_resource() {
#haproxy
  wget https://raw.githubusercontent.com/RoFatNya/haproxy/master/haproxy-1.8.5.tar.gz
  mkdir /etc/haproxy
  wget /etc/haproxy/haproxy.cfg https://raw.githubusercontent.com/RoFatNya/config/master/haproxy/haproxy.cfg
#shadowsocks
  wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh && chmod +x shadowsocks-all.sh
#bbr
  wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh
#speedtest-cli
  wget -O speedtest-cli https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py && chmod +x speedtest-cli
}

install() {
#haproxy
  tar -zxvf haproxy-1.8.5.tar.gz
  cd haproxy-1.8.5
  make TARGET=linux2628 ARCH=x86_64 PREFIX=/usr/local/haproxy
  make install PREFIX=/usr/local/haproxy
  cp haproxy /usr/sbin/haproxy
  mkdir /etc/haproxy
  wget /etc/haproxy/haproxy.cfg https://raw.githubusercontent.com/RoFatNya/config/master/haproxy/haproxy.cfg
  cd ..
#v2ray
  bash <(curl -L -s https://install.direct/go.sh)
#v2rayConfig
  wget /etc/v2ray/config.json https://raw.githubusercontent.com/RoFatNya/config/master/v2ray/config.json
#bbr
  bash ./bbr.sh
#shadowsocks
  bash shadowsocks-all.sh
}

#port
open_port() {
  firewall-cmd --permanent --zone=public --add-port=7777/tcp
  firewall-cmd --permanent --zone=public --add-port=7777/udp

  firewall-cmd --permanent --zone=public --add-port=777/tcp
  firewall-cmd --permanent --zone=public --add-port=777/udp

  firewall-cmd --permanent --zone=public --add-port=443/tcp
  firewall-cmd --permanent --zone=public --add-port=443/udp

  firewall-cmd --permanent --zone=public --add-port=840/tcp
  firewall-cmd --permanent --zone=public --add-port=840/udp

  firewall-cmd --permanent --zone=public --add-port=850/tcp
  firewall-cmd --permanent --zone=public --add-port=850/udp

  firewall-cmd --permanent --zone=public --add-port=888/tcp
  firewall-cmd --permanent --zone=public --add-port=888/udp

  firewall-cmd --permanent --zone=public --add-port=10000-11000/tcp
  firewall-cmd --permanent --zone=public --add-port=10000-11000/udp
  firewall-cmd --reload
}

download_resource
open_port
