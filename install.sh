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
    echo "[+]Done!"
}

# Main
main() {
    fullsystemupdate
}

main