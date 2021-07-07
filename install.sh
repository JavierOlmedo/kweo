#!/bin/sh
#by @jjavierolmedo

# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# Check Kali Linux System

# Full System Update
fullsystemupdate(){
    echo "${GREEN}-----------------------[Updating system]-----------------------${NC}"
    sudo apt update -y && sudo apt autoremove -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
    echo "${GREEN}[+] Updating system --> Done!${NC}"
}

installpackages(){
    echo "${GREEN}-----------------------[Install Packages]-----------------------${NC}"
    sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
    echo "${GREEN}[+] Install Packages --> Done!${NC}"
}

# Main
main() {
    fullsystemupdate
    installpackages
}

main