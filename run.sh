
#!/bin/bash
cd ~
git clone https://github.com/drubuntu/installation .
cd installation
bash install.sh 2>$HOME/errors.txt
rm ~/installation
rm -- "0"
