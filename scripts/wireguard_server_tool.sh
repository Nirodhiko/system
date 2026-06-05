#!/bin/bash
file=/etc/wireguard/wg0.conf
line=$(grep "ListenPort = " $file)
listen_port=$(echo $line | sed 's/^.*ListenPort = //')
let listen_port++
sed -i "s/\(ListenPort = \).*/\1$listen_port/" $file
sudo wg-quick down wg0
sudo wg-quick up wg0
