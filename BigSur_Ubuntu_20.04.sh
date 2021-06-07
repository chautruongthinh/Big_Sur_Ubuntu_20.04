#!/bin/bash
set -e
sudo timedatectl set-timezone Asia/Ho_Chi_Minh
# Install apps
sudo apt-get update
sudo apt install curl gnome-tweaks chrome-gnome-shell plank -y

# Install Chrome
curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb

# Themes
sudo tar -C /usr/share/themes -xf Themes/WhiteSur-light-Gnome-3-28.tar.xz
sudo tar -C /usr/share/themes -xf Themes/WhiteSur-dark-Gnome-3-28.tar.xz

#Icon
sudo tar -C /usr/share/icons/ -xf Icons/01-WhiteSur.tar.xz
sudo cp -rf Icons/ubuntu-logo-icon.png /usr/share/icons/hicolor/256x256/apps/
#Cursors
sudo tar -C /usr/share/icons/ -xf Cursors/McMojave-cursors.tar.xz
rm -rf McMojave-cursors.tar.xz

#Plank Themes
sudo tar -C /usr/share/plank/themes/ -xf Plank_Themes/WhiteSur-light.tar.xz
rm -rf WhiteSur-light.tar.xz

#Wallpaper
sudo cp -rf Wallpaper/2560x1440.png /usr/share/backgrounds/big_sur.png

#GNOME Shell integration
google-chrome https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep?hl=en
wait

#User Themes Gnome Extension
google-chrome https://extensions.gnome.org/extension/19/user-themes/
wait

#Compiz windows effect extension
google-chrome https://extensions.gnome.org/extension/3210/compiz-windows-effect/
wait

# Open Weather
google-chrome https://extensions.gnome.org/extension/750/openweather/
wait

# Albert Installation 
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | sudo apt-key add -
echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
sudo wget -nv https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key -O "/etc/apt/trusted.gpg.d/home:manuelschneid3r.asc"
sudo apt update
sudo apt install albert -y

#Remove extension dock
sudo apt remove gnome-shell-extension-ubuntu-dock -y

#Tweaks

gsettings set org.gnome.desktop.interface gtk-theme 'WhiteSur-dark'
gsettings set org.gnome.desktop.interface icon-theme 'WhiteSur-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'McMojave-cursors'
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/big_sur.png'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/big_sur.png'

gnome-tweaks
wait

plank --preferences
wait

albert preferences
wait

read -p "Do you want to reboot(Y/N)?" reboot
if [[ $reboot == *"y"* || $reboot == *"Y"* ]];then
	sudo reboot
fi
if [[ $reboot == *"n"* || $reboot == *"N"* ]];then
	exit
fi

