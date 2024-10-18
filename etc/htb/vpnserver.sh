#!/bin/bash

# Get the file name of the running OpenVPN configuration
vpn_config_file=$(ps aux | grep "[s]udo openvpn" | head -n 1 | awk '{print $NF}')

# Check if the file name was found
if [ -z "$vpn_config_file" ]; then
    exit 1
fi

# Strip any path components to get just the filename
vpn_config_file=$(basename "$vpn_config_file")

# Construct the full path using the HOME variable
vpn_config_path="$HOME/.vpn/$vpn_config_file"

# Extract the server name from the .ovpn file
server_name=$(grep "remote " "$vpn_config_path" | awk '{print $2}' | cut -d "." -f 1 | cut -d "-" -f 2-)

# Echo the server name
echo "$server_name"

