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
    echo "${YELLOW}[+] Install Polybar packages${NC}"
    sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev -y
    echo "${YELLOW}[+] Install Picom packages${NC}"
    sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
    echo "${YELLOW}[+] Install Ninja${NC}"
    sudo apt install ninja-build -y
    echo "${YELLOW}[+] Install Meson${NC}"
    sudo apt install meson -y
    echo "${YELLOW}[+] Install Rofi${NC}"
    sudo apt install rofi -y
    echo "${YELLOW}[+] Install Firejail${NC}"
    sudo apt install firejail -y
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
    echo "${YELLOW}[+] Install Polybar${NC}"
    cd ~/.tmp
    git clone --recursive https://github.com/polybar/polybar
    cd ~/.tmp/polybar
    mkdir build
    cd ~/.tmp/polybar/build/
    cmake ..
    make -j$(nproc)
    sudo make install
    echo "${YELLOW}[+] Install Picom${NC}"
    cd ~/.tmp
    git clone https://github.com/ibhagwan/picom.git
    cd picom/
    git submodule update --init --recursive
    meson --buildtype=release . build
    ninja -C build
    sudo ninja -C build install
    echo "${GREEN}[+] Install Gits --> Done!${NC}"
    cd
}

configfiles(){
    echo "${GREEN}-----------------------[Config files]-----------------------${NC}"
    echo "${YELLOW}[+] Downloading BSPWM config file${NC}"
    cd ~/.config/bspwm
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/bspwmrc
    sudo chmod +x ~/.config/bspwm/bspwmrc
    echo "${YELLOW}[+] Downloading SXHKD config file${NC}"
    cd ~/.config/sxhkd
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/sxhkdrc
    echo "${YELLOW}[+] Downloading bspwm_resize file${NC}"
    cd ~/.config/bspwm/scripts
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/bspwm_resize
    sudo chmod +x ~/.config/bspwm/scripts/bspwm_resize
    echo "${GREEN}[+] Config files --> Done!${NC}"
}

installfirefox(){
    sudo chown jolmedo:jolmedo /opt
    cd ~/Downloads
    wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/89.0.2/linux-x86_64/en-US/firefox-89.0.2.tar.bz2
    cd /opt
    mv ~/Downloads/firefox-89.0.2.tar.bz2 .
    tar -xf firefox-89.0.2.tar.bz2
    rm firefox-89.0.2.tar.bz2

    #add foxyproxy and yeswehack

    echo "${YELLOW}[+] TEMPORALLLLLLLLLLLLLLLLL${NC}"
    sudo apt install firejail -y
    rm ~/.config/sxhkd/sxhkdrc
    cd ~/.config/sxhkd
    wget https://raw.githubusercontent.com/JavierOlmedo/kweo/master/sxhkdrc

}

installfonts(){
    cd ~/Downloads
    wget https://github.com/tonsky/FiraCode/releases/download/5.2/Fira_Code_v5.2.zip
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    cd /usr/local/share/fonts
    sudo mv ~/Downloads/Fira_Code_v5.2.zip .
    sudo mv ~/Downloads/Hack.zip .
    unzip Fira_Code_v5.2.zip
    unzip Hack.zip
    rm Fira_Code_v5.2.zip
    rm Hack.zip  
}

# Main
main() {
    #fullsystemupdate
    #makefolders
    #installpackages
    #installgits
    #configfiles
    #installfirefox
    installfonts
    echo "${GREEN}[+] Reboot your system and enjoy!!${NC}"
}

main
#22