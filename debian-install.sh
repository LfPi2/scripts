#!/bin/sh

if [ $(id -u) = "0" ]; then
	echo 'You should not run the script as root'
	exit
fi

REPO_PATH="$(pwd)"

cd ~

sudo apt-get -y update
sudo apt-get -y install git gcc make man-db unzip curl wget
sudo apt-get -y install xorg pulseaudio
sudo apt-get -y install libx11-dev libxft-dev libxinerama-dev dbus-x11
sudo apt-get -y install xdg-user-dirs feh acpi picom htop ssh bat rsync
sudo apt-get -y install neovim kitty nodejs npm flatpak
sudo apt-get -y install firefox-esr thunar pavucontrol mpv
sudo apt-get -y install neofetch cowsay cmatrix cbonsai lolcat cava

xdg-user-dirs-update
mkdir ~/code
mkdir ~/repos

cd ~/repos

git clone https://github.com/LfPi2/dwm
git clone https://github.com/LfPi2/dmenu
git clone https://github.com/EliverLara/Nordic
git clone --separate-git-dir ~/.dotfiles https://github.com/LfPi2/dotfiles temp-dotfiles

cd dwm
make
sudo make clean install
cd ../dmenu
make
sudo make clean install
cd ..
sudo cp -r Nordic /usr/share/themes
rsync -rv --exclude='.git' temp-dotfiles/ ~/

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

cd $REPO_PATH

curl -sS https://starship.rs/install.sh | sudo sh
sudo unzip font-mononoki.zip -d /usr/share/fonts
