
#!/bin/bash
echo "You'll install Drubuntu now! Enter your passwort  or hit CTRL+C to abbort installation"
apt -y install git
git clone https://github.com/drubuntu/installation $HOME/installation
cd $HOME/installation
bash install.sh 2>$HOME/errors.txt
rm -r $HOME/installation
rm -- "0"
