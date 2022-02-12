#!/bin/bash

ifdown vpn_se
./vpnclient stop
sleep 5

ip route del 219.100.37.153/32
ip route del default
ip route add default via 192.168.0.1 dev wlo1
exit 0
