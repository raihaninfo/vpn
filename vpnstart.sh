#!/bin/bash

./vpnclient start
sleep 5
ifup vpn_se
ip route add 219.100.37.153/32 via 192.168.0.1 dev wlo1
ip route del default via 192.168.0.1 dev wlo1
ip route add default via 35.232.111.17 dev vpn_se

exit 0
