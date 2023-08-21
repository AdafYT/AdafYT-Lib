#!/bin/bash
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root." 
    exit 1
fi
sudo apt update
sudo apt upgrade -y
sudo apt install git -y
git clone https://github.com/Hax4us/java
clear
echo "Main script done!"
echo "Initialization..."
sudo bash AdafYT_Lib.sh


