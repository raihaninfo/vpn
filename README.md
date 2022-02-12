## SoftEtherVPN Client

cd vpnclient

> make

> sudo ./vpnclient start

> ./vpncmd

Select No 3 (use of vpn tools)

> check

## 2. Configure SoftEther VPN Client

> ./vpncmd

select no 2

press enter

> remoteenable

> niccreate

any name

> > se

> accountcreate

> > new

ip and poot

> > 219.100.37.153:443

any

> > Destination Virtual Hub Name: vpngate

any

> > Connecting User Name: raihan

> > Used Virtual Network Adapter Name: se

> accountlist

`accountpasswordset <account>`

> accountpasswordset new

> accountstartupset

> > new

> accountconnect new

```
sudo nano  /etc/sysctl.conf
```

uncomment

```
#net.ipv4.conf.default.rp_filter=1
net.ipv4.conf.default.rp_filter=1
```

> sudo sysctl -p

> ip addr show vpn_se

> sudo dhclient vpn_se

> ip route

> sudo ip route add 219.100.37.153/32 via 192.168.0.1 dev wlo1

> sudo ip route del default via 192.168.0.1 dev wlo1

```
sudo su
echo "nameserver 8.8.8.8">>"/etc/resolv.conf"
exit
```

> wget -qO- icanhazip.com

> sudo nano /etc/network/interfaces

```
auto-hotplug vpn_se
iface vpn_se inet dhcp
```

## bash script

> sudo nano vpnstart.sh

```
#!/bin/bash

vpnclient start
sleep 5
ifup vpn_se
ip route add 219.100.37.153/32 via 192.168.0.1 dev wlo1
ip route del default via 192.168.0.1 dev wlo1
ip route add default via 35.232.111.17 dev vpn_se

exit 0

```

> sudo nano vpnstop.sh

```
#!/bin/bash

ifdown vpn_se
vpnclient stop
sleep 5

ip route del 219.100.37.153/32
ip route del default
ip route add default via 192.168.0.1 dev wlo1
exit 0
```
