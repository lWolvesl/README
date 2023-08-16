#!/bin/bash

ip tuntap add mode tun dev tun0
ip addr add 198.18.0.1/15 dev tun0
ip link set dev tun0 up

ip route del default
ip route add default via 198.18.0.1 dev tun0 metric 1
ip route add default via 172.17.0.1 dev eth0 metric 10

/tun/tun2socks -device tun0 -proxy socks5://192.168.31.5:7890 -interface eth0