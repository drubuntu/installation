#!/bin/bash
if [ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

    echo -e " ${lightred}  ${runasrootmssg} ${NC}"


    exit
4 
fi
if [ "$LANG" == "de_DE.UTF-8" ];then
wyltidmssg="Möchten Sie Drubuntu jetzt installieren"
else
wyltidmssg="Would you like to install drubuntu now?"
fi
bdir=/opt/.drubuntu
sudo apt -y -qq install git git-core
function clone(){
cd "$HOME"
git clone https://github.com/drubuntu/installation.git "$HOME"/installation
git clone https://github.com/drubuntu/features.git "$HOME"/features
git clone https://github.com/drubuntu/desktops.git "$HOME"/desktops
}
function copy(){
sudo cp -r "$HOME"/installation/* /opt/.drubuntu
sudo cp -r "$HOME"/desktops/desktopchooser.sh /opt/drubuntu/desktopchooser.sh
sudo cp -r "$HOME"/features/features.sh /opt/drubuntu/features.sh
sudo chmod +x "$bdir"/*.sh	
}
function delete(){
sudo rm -r installation features desktops
}
if ! [ -d /opt/.drubuntu ];then
echo "Install Drubuntu fiirst"
while true; do
		read -p "${wyltidmssg}" yn
		case $yn in
[Yy]* ) 
cd $HOME/installation
sudo bash install.sh 2>$HOME/errors.txt
 ;;
		[Nn]* ) rm -r $0;;
		esac
	done  
	else
	clone 
	copy
	delete
	sudo rm -r $0
	fi
