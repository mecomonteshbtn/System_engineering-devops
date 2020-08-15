#!/usr/bin/env bash
# Configure HAProxy load balancer server

apt-get -y install software-properties-common
add-apt-repository -y ppa:vbernat/haproxy-1.8
apt-get -y update
apt-get -y install haproxy=1.8.\*
echo "frontend http
        bind *:80
        mode http
        default_backend web-backend
    backend web-backend
        balance roundrobin
        server 1574-web-01 35.227.35.75
        server 1574-web-02 100.24.37.33" >> /etc/haproxy/haproxy.cfg

service haproxy restart
