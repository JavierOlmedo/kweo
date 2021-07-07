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
    echo "${YELLOW}[+] Full system update${NC}"
    sudo apt update -y && sudo apt autoremove -y && sudo apt upgrade -y && sudo apt dist-upgrade -y
    echo "${GREEN}[+] Updating system --> Done!${NC}"
}

# Make folders
makefolders(){
    echo "${GREEN}-----------------------[Make folders]-----------------------${NC}"
    echo "${YELLOW}[+] Creating .config folder${NC}"
    mkdir ~/.config
    echo "${YELLOW}[+] Creating .tmp folder${NC}"
    mkdir ~/.tmp
    echo "${YELLOW}[+] Creating .config/bspwm folder${NC}"
    mkdir ~/.config/bspwm
    echo "${YELLOW}[+] Creating .config/sxhkd folder${NC}"
    mkdir ~/.config/sxhkd
    echo "${GREEN}[+] Make folders --> Done!${NC}"
}

installpackages(){
    echo "${GREEN}-----------------------[Install Packages]-----------------------${NC}"
    echo "${YELLOW}[+] Install BSPWM and SXHKD packages${NC}"
    sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
    echo "${GREEN}[+] Install Packages --> Done!${NC}"
}

installgits(){
    echo "${GREEN}-----------------------[Install Gits]-----------------------${NC}"
    cd ~/.tmp
    echo "${YELLOW}[+] Downloading BSPWM from Github${NC}"
    git clone https://github.com/baskerville/bspwm.git
    echo "${YELLOW}[+] Downloading SXHKD from Github${NC}"
    git clone https://github.com/baskerville/sxhkd.git


    echo "${YELLOW}[+] Install BSPWM${NC}"
    cd ~/.tmp/bspwm
    make
    sudo make install
    echo "${YELLOW}[+] Install SXHKD${NC}"
    cd ~/.tmp/sxhkd
    make
    sudo make install
    echo "${YELLOW}[+] Install BSPWM from APT${NC}"
    sudo apt install bspwm
    echo "${GREEN}[+] Install Gits --> Done!${NC}"
}

# Main
main() {
    fullsystemupdate
    makefolders
    installpackages
    installgits
}

main
#22