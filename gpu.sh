#!/bin/bash

#GPU // Automatisations
if [ "${autodetect_graphics}" = "Install" ] ; then
	if [ "$(lspci | grep -i nvidia | grep VGA -c)" != "0" ] ; then
		nvidia="Install"
	fi
	if [ "$(lspci | grep -i amd | grep VGA -c)" != "0" ] ; then
		amd="Install"
	fi
	if [ "$(lspci | grep -i intel | grep VGA -c)" != "0" ] ; then
		intel="Install"
	fi
fi

# Installations
pkg_graphics=""
if [[ "${nvidia}" = "Install" || "${amd}" = "Install" || "${intel}" = "Install" ]] ; then
	if [ "${nvidia}" = "Install" ] ; then
        yay -S nvidia nvidia-utils lib32-nvidia-utils lib32-vulkan-driver
    fi
    	if [[ "${amd}" = "Install" || "${intel}" = "Install" ]] ; then
		yay -S --noconfirm mesa lib32-mesa vulkan-mesa-layers 
	fi
	if [ "${amd}" = "Install" ] ; then
		yay -S --noconfirm xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon 
	fi
	if [ "${intel}" = "Install" ] ; then
		yay -S --noconfirm vulkan-intel lib32-vulkan-intel 
	fi
fi
echo "GPU OK"