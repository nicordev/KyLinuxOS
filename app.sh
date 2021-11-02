#! /bin/bash

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

###### Functions ######

askContinueDefaultYes() {
    echo -e "\e[1mContinuer?\e[0m [Y/n] "
    read -n 1 answer

    if [[ ${answer,,} == n ]]; then
        return 1
    fi
}

askWhichProgramsToInstall() {
	echo "Installer les plateformes de jeux?"
	askContinueDefaultYes

	if [ $? == 0 ]
	then
		programsToInstall="${programsToInstall} lutris steam-native-runtime heroic-games-launcher-bin"
	fi

	echo "Installer les surcouche de compatibilité?"
	askContinueDefaultYes

	if [ $? == 0 ]
	then
		programsToInstall="${programsToInstall} wine-staging winetricks proton-ge-custom-bin"
	fi

	echo "Installer les noyaux de Jeux?"
	askContinueDefaultYes

	if [ $? == 0 ]
	then
		programsToInstall="${programsToInstall} linux-zen linux-zen-header gamemode lib32-gamemode"
	fi

	echo "Installer le clavardages?"
	askContinueDefaultYes

	if [ $? == 0 ]
	then
		programsToInstall="${programsToInstall} discord"
	fi

	echo "Installer les outils materiel?"
	askContinueDefaultYes

	if [ $? == 0 ]
	then
		programsToInstall="${programsToInstall} mangohud openrgb piper"
	fi

	echo $programsToInstall
}

install() {
	yay -S ${programsToInstall}
}

sayGoodbye() {
	echo "

	AmuseToiBien :)

	"
}

###### End Functions ######

askWhichProgramsToInstall # En mettant ta logique dans des fonctions, tu peux facilement changer l'ordre d'exécution, ici par exemple j'ai déplacé l'installation après le choix des programmes à installer
install && sayGoodbye # Le `&&` va permettre de n'appeler la fonction `sayGoodbye` que si la fonction `install` s'est exécutée sans erreur
