#!/bin/bash

#YAY
read -r -p "Installer yay? [y/N] " response
if [[ "$response" =~ ^([yY][oO][sS]|[yY])$ ]]
then
    cd tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
else
    echo "Merci"
fi