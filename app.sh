#!/bin/sh

###Logiciels###

##Plateforme de jeux
#Lutris="Plateforme de jeux"
#Steam="Plateforme de jeux"
#HeroicGames="Plateforme de jeux"

##Surcouche de compatibilité
#Winestaging="wine-staging "
#Winetricks="winetricks"
#ProtonGE="proton-ge-custom-bin"

##Kernel
#Linuxzen="linux-zen linux-zen-header"
#Gamemode="gamemode lib32-gamemode"

##Clavardages
#Discord="discord"

##Materiel
#Mangohud="mangohud"
#Openrgb="openrgb"
#Souris="piper"

#Gestionnaire de paquets
yay -S ${gestionnaire} 
no_install="false"

function_name function askQuestion {
	if [[ "$default" = "" || "$default" =~ ^[Yy]$ ]] ; then
		default="y"
		echo -n "$question [Y/n] "
	else
		echo -n "$question [y/N] "
	fi
	if [ "${no_install}" != "true" ] ; then
		read -n 1 answer
	else
		answer="${default}"
		echo "${default} (autoselected)"
	fi
	if [[ "${answer}" =~ ^[Yy]$ || ( "${default}" = "y" && "${answer}" = "" ) ]];then
		answer="true"
	else
		answer="false"
	fi
}

# Installation
question="Installer les plateformes de jeux"?
askQuestion 
if [ "${answer}" != "true" ] ; then
	gestionnaire="${gestionnaire} lutris steam-native-runtime heroic-games-launcher-bin"
fi
echo

question="Installer les surcouche de compatibilité?"
askQuestion
if [ "${answer}" != "true" ] ; then
	gestionnaire="${gestionnaire} wine-staging winetricks proton-ge-custom-bin"
fi
echo

question="Installer les noyaux de Jeux?"
askQuestion
if [ "${answer}" != "true" ] ; then
	gestionnaire="${gestionnaire} linux-zen linux-zen-header gamemode lib32-gamemode"
fi
echo

question="Installer le clavardages?"
askQuestion
if [ "${answer}" != "true" ] ; then
	gestionnaire="${gestionnaire} discord"
fi
echo

question="Installer les outils materiel?"
askQuestion
if [ "${answer}" != "true" ] ; then
	gestionnaire="${gestionnaire} mangohud openrgb piper"
fi

echo "

AmuseToiBien :)

"