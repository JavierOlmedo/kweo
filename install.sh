#!/bin/sh
#by @jjavierolmedo
#thanks to @S4vitar ;) - https://www.youtube.com/watch?v=mHLwfI1nHHY
#https://pastebin.com/EEX1Dsuq

# Install
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/JavierOlmedo/kweo/master/install.sh)"

# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
NC='\033[0m'

# Full System Update
fullsystemupdate(){
    echo "${GREEN}-----------------------[Updating system]-----------------------${NC}"
    echo "${YELLOW}[+] Full system update${NC}"
    sudo apt update -y && sudo apt list --upgradable && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
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
    echo "${YELLOW}[+] Creating .config/bspwm/scripts folder${NC}"
    mkdir ~/.config/bspwm/scripts
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
    sudo apt install bspwm -y
    echo "${GREEN}[+] Install Gits --> Done!${NC}"
    cd
}

configfiles(){
    echo "${GREEN}-----------------------[Config files]-----------------------${NC}"
    echo "${YELLOW}[+] Downloading BSPWM config file${NC}"
    cd ~/.config/bspwm
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/bspwmrc
    chmod +x ~/.config/bspwm/bspwmrc
    echo "${YELLOW}[+] Downloading SXHKD config file${NC}"
    cd ~/.config/sxhkd
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/sxhkd
    echo "${YELLOW}[+] Downloading bspwm_resize file${NC}"
    cd ~/.config/bspwm/scripts
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/bspwm_resize
    chmod +x ~/.config/bspwm/scripts/bspwm_resize
    echo "${GREEN}[+] Config files --> Done!${NC}"
}

# Main
main() {
    fullsystemupdate
    #makefolders
    #installpackages
    #installgits
    #configfiles
}

main
#22