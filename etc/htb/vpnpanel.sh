#!/bin/bash
htbip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)
lab=$(cat /etc/openvpn/*.conf | grep "remote " | cut -d " " -f 2 | cut -d "." -f 1 | cut -d "-" -f 2-)

if [[ $htbip == *"10."* ]]
then
   gwip=$(route -n | grep tun0 | grep UG | tr -s " " | cut -d " " -f 2 | sort -u)
   ping=$(ping -c 1 $gwip -W 1 | sed '$!d;s|.*/\([0-9.]*\)/.*|\1|' | cut -c1-4)
   echo "𝗩𝗣𝗡 - $htbip [$ping ms]"
else
   echo "No VPN"
fi