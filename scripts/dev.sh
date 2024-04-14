#!/bin/bash
# -------------------------------------------------------------
#
# Script d'installation des outils de developpement.
#
# -------------------------------------------------------------

# Test si root
if [ `id -u` -ne 0 ]
  then echo "Veuillez executer le script en root";
	exit;
fi


pacman -S --needed nodejs npm jdk-openjdk dbeaver mariadb

# Installation d'angular
echo ":: Installation d'angular"
npm install -g @angular/cli

