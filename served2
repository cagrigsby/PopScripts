#!/bin/bash
# Quick productivity tool for launching various services on Kali
# Intended for use in exams like OSCP, PNPT
# Colors for better visibility

#created by /u/sankalp9 and modified by me, Pop

GREEN='\033[0;32m'
NC='\033[0m' # No Color

function banner() {
    echo -e "${GREEN}=====================================${NC}"
    echo -e "${GREEN} Productivity Tool for Exams ${NC}"
    echo -e "${GREEN}=====================================${NC}"
}

# HTTPS server (using Python's built-in server)
function start_https_server() {
    read -p "Enter the port (default 443): " PORT
    PORT=${PORT:-443}
    read -p "Enter the directory to serve (default: current): " DIRECTORY
    DIRECTORY=${DIRECTORY:-$(pwd)}

    echo -e "${GREEN}Starting HTTPS server on port ${PORT}...${NC}"
    echo -e "${GREEN}Serving directory: ${DIRECTORY}${NC}"

    # Generate self-signed certificate if not existing
    if [ ! -f server.pem ]; then
        echo -e "${GREEN}Generating self-signed certificate...${NC}"
        openssl req -new -x509 -keyout server.pem -out server.pem -days 365 -nodes -subj "/C=US/ST=Exam/L=Lab/O=Kali/CN=localhost"
    fi

    # Start HTTPS server using Python
    echo -e "${GREEN}Press CTRL+C to stop the server.${NC}"
    sudo python3 -m http.server --bind 0.0.0.0 "$PORT" --directory "$DIRECTORY" --ssl-version SSLv23 --certfile server.pem
}

# SMB share (using Samba)
function start_smb_share() {
    read -p "Enter the directory to share: " SHARE_DIR
    SHARE_DIR=${SHARE_DIR:-$(pwd)}
    read -p "Enter the share name: " SHARE_NAME

    echo -e "${GREEN}Starting SMB share...${NC}"

    # Create Samba configuration
    sudo tee /etc/samba/smb.conf > /dev/null <<EOL
[global]
   workgroup = WORKGROUP
   security = user
   map to guest = Bad User

[$SHARE_NAME]
   path = $SHARE_DIR
   browsable = yes
   writable = yes
   guest ok = yes
   read only = no
EOL

    # Restart Samba service
    sudo systemctl restart smbd
    echo -e "${GREEN}SMB share $SHARE_NAME started. Accessible via: \\\\$(hostname -I | awk '{print $1}')\\$SHARE_NAME${NC}"
}

# FTP server (using Python's pyftpdlib)
function start_ftp_server() {
    read -p "Enter the port (default 21): " FTP_PORT
    FTP_PORT=${FTP_PORT:-21}

    echo -e "${GREEN}Starting FTP server on port ${FTP_PORT}...${NC}"

    # Start FTP server using Python's pyftpdlib
    sudo python3 -m pyftpdlib -p "$FTP_PORT"
}

# WebDAV server (using wsgidav)
function start_webdav_server() {
    read -p "Enter the directory to serve (default: current): " WEBDAV_DIR
    WEBDAV_DIR=${WEBDAV_DIR:-$(pwd)}
    read -p "Enter the port (default 8080): " WEBDAV_PORT
    WEBDAV_PORT=${WEBDAV_PORT:-8080}

    echo -e "${GREEN}Starting WebDAV server on port ${WEBDAV_PORT}...${NC}"

    # Start WebDAV server using wsgidav
    sudo wsgidav --host=0.0.0.0 --port="$WEBDAV_PORT" --root="$WEBDAV_DIR" --auth=anonymous
}

# Menu to select service
function menu() {
    banner
    echo "Select a service to start:"
    echo "1) HTTPS Server"
    echo "2) SMB Share"
    echo "3) FTP Server"
    echo "4) WebDAV Server"
    echo "5) Exit"
    read -p "Enter choice [1-5]: " CHOICE

    case "$CHOICE" in
        1) start_https_server ;;
        2) start_smb_share ;;
        3) start_ftp_server ;;
        4) start_webdav_server ;;
        5) exit 0 ;;
        *) echo "Invalid option" ;;
    esac
}

# Run the menu in a loop
while true; do
    menu
done
