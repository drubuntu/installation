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
sudo apt -y -qq install git git-core
function clone(){
cd "$HOME"
git clone https://github.com/drubuntu/installation.git "$HOME"/installation
git clone https://github.com/drubuntu/features.git "$HOME"/features
git clone https://github.com/drubuntu/desktops.git "$HOME"/desktops
}
function copy(){
sudo cp -r installation/* /opt/.drubuntu
sudo cp -r features/desktopchooser.sh /opt/drubuntu/desktopchooser.sh
sudo cp -r features/features.sh /opt/drubuntu/features.sh
sudo chmod +x /opt/.drubutu/*.sh
}
function delete(){
sudo rm -r installation features desktops
sudo rm  -r /opt/.drubuntu/files
	
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
		[Nn]* ) 
		esac
	done  
	else
	clone 
	copy
	delete
	fi
