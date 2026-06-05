#!/bin/bash

# Copy configuration file from remote server to local machine
scp root@www.buddhiko.com:/etc/wireguard/wg0.conf /tmp/

# Read the value of ListenPort from the local configuration file
listen_port=$(awk '/^ListenPort/{print $3}' /tmp/wg0.conf)

echo "ListenPort: $listen_port"

# Remove the local copy of the configuration file
rm /tmp/wg0.conf

# Read configuration file wg0.conf
filename=/etc/wireguard/wg0.conf

# Find Endpoint in the file
endpoint=$(sudo grep "^Endpoint" $filename)

# Extract the port number from the Endpoint line
endpoint_value=$(echo $endpoint | awk -F ":" '{print $2}')

# Replace the port number in the Endpoint line in the configuration file
sudo sed -i "s/:$endpoint_value$/:$listen_port/" $filename

echo "Done."
