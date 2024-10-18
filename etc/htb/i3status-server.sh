#!/bin/bash

# Get the VPN IP address
htbip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

# Get the file name of the running OpenVPN configuration
vpn_config_file=$(ps aux | grep "[s]udo openvpn" | head -n 1 | awk '{print $NF}')

# Strip any path components to get just the filename
vpn_config_file=$(basename "$vpn_config_file")

# Check if the VPN is connected and has an IP
if [[ -z "$htbip" || -z "$vpn_config_file" ]]; then
    echo "VPN not connected"
    exit 1
fi

# Construct the full path for the .ovpn file (check if the file exists)
vpn_config_path="$HOME/.vpn/$vpn_config_file"

if [ ! -f "$vpn_config_path" ]; then
    echo "VPN configuration file not found!"
    exit 1
fi

# Extract the VPN server name from the .ovpn file
server_name=$(grep "remote " "$vpn_config_path" | awk '{print $2}' | cut -d "." -f 1 | cut -d "-" -f 2-)

# Check if server_name was found
if [ -z "$server_name" ]; then
    echo "hackthebox vpn not connected"
    exit 1
fi

# Get the VPN gateway IP
gwip=$(route -n | grep tun0 | grep UG | tr -s " " | cut -d " " -f 2 | sort -u)

# Get the ping time to the VPN gateway, handling potential failures
ping_output=$(ping -c 1 $gwip -W 1)
ping_time=$(echo "$ping_output" | grep 'time=' | awk -F'time=' '{print $2}' | cut -d ' ' -f 1)

# Check if ping_time was obtained
if [ -z "$ping_time" ]; then
    ping_time="N/A"
fi

# Output the VPN connection status
echo "⬢ hackthebox $server_name $htbip [$ping_time ms]"

