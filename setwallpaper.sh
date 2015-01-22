#!/bin/bash
if [ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

    echo "Please run this script as root or using sudo"

    exit
4 
fi
wget -O  /usr/share/backgrounds/drubuntu-wallpaper.png  https://drubuntu.googlecode.com/git/files/images/drubuntu-wallpaper.png  


if [ -f "/usr/share/backgrounds/elementaryos-default" ]; then
sudo rm /usr/share/backgrounds/elementaryos-default 
sudo ln  /usr/share/backgrounds/drubuntu-wallpaper.png /usr/share/backgrounds/elementaryos-default 
fi

gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/drubuntu-wallpaper.png"

