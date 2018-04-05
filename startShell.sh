#! /bin/bash

#download

#haproxy
wget https://raw.githubusercontent.com/RoFatNya/haproxy/master/haproxy-1.8.5.tar.gz
tar -zxvf haproxy-1.8.5.tar.gz
cd haproxy-1.8.5
make TARGET=linux2628 ARCH=x86_64 PREFIX=/usr/local/haproxy
make install PREFIX=/usr/local/haproxy
cp haproxy /usr/sbin/haproxy
wget -O /etc/haproxy/haproxy.cfg https://raw.githubusercontent.com/RoFatNya/config/master/haproxy/haproxy.cfg
cd ..

#v2ray
bash <(curl -L -s https://install.direct/go.sh)
wget -O /etc/v2ray/config.json https://raw.githubusercontent.com/RoFatNya/config/master/v2ray/config.json

#bbr
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

#shadowsocks
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh

#port
firewall-cmd --zone=public --add-port=777/tcp --permanent
firewall-cmd --zone=public --add-port=777/udp --permanent

firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=443/udp --permanent

firewall-cmd --zone=public --add-port=840/tcp --permanent
firewall-cmd --zone=public --add-port=840/udp --permanent

firewall-cmd --zone=public --add-port=850/tcp --permanent
firewall-cmd --zone=public --add-port=850/udp --permanent

firewall-cmd --zone=public --add-port=888/tcp --permanent
firewall-cmd --zone=public --add-port=888/udp --permanent

firewall-cmd --zone=public --add-port=10000-11000/tcp --permanent
firewall-cmd --zone=public --add-port=10000-11000/udp --permanent

firewall-cmd --reload

reboot
