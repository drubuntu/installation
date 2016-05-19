
#!/bin/bash
if [ "$LANG" == "de_DE.UTF-8" ];then
echo "Um Drubuntu zu installieren geben Sie Ihr Passwort ein oder drücken Sie STRG+C um abzubrechen."
else
echo "You'll install Drubuntu now! Enter your passwort  or hit CTRL+C to abbort installation"
fi
sudo apt -y install git  >> /dev/null 2>&1
git clone https://github.com/drubuntu/installation $HOME/installation
cd $HOME/installation
sudo bash install.sh 2>$HOME/errors.txt
rm -r $HOME/installation
