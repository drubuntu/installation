
#!/bin/bash
black=red='\033[0;30m'
red='\033[0;31m'
blue='\033[0;34m'
green='\033[0;32m'
cyan='\033[0;36m'
purple='\033[0;35m'
white='\033[0;37m'
orange='\033[0;33m'
lightgray='\033[0;37m'
darkgray='\033[1;30m'
lightblue='\033[1;34m'
lightgreen='\033[1;32m'
lightcyan='\033[1;36m'
lightred='\033[1;31m'
lightpurple='\033[1;35m'
yellow='\033[1;33m'
NC='\033[0m'
source $PWD/functions.sh
source $PWD/filetemplates.sh
source $PWD/de.sh
#first echo creates space after sudo input
clear
echo ""
echo -e " ${lightblue} ${wcmssg1} ${nc}"
echo ""
# > /dev/null to hide the output
#basic setup
echo -e " ${green} Update Ubuntu's Repositories ${NC}"
aptupdate
echo -e " ${lightgreen} - Creating base directories ${NC}"
echo ""
mkdirs
#virtual platformtools
echo -e " ${purple} - We're installing VM-Tools depending on you're VM's vendor. ${NC}"
echo ""
vtoolscheck
#package installation
echo -e " ${lightgreen} - Installing packages. This will take a while ... ${NC}"
echo ""
apt-progress
getcorepkgs
getcomposer
getdrush
uploadprogress
getgems
#fetch required files
echo -e " ${lightgreen} - Creating nessesary files. ${NC}"
echo ""
crissue
crprofiledfile
getfiles
#create symbolic links
echo -e " ${lightgreen} - Creating symbolic links in your users Home. ${NC}"
echo ""
crsymlinks
crbinsymlinks
#setting up server
echo -e " ${lightblue} - Setting up Drupal and the LAMP. ${NC}"
echo ""
crd7cffile
createdb_d7
d7setup
crd8cffile
createdb_d8
d8setup
apache2setup
echo ""
# last steps
echo -e " ${yellow} - Installing Drubuntu plymouth logo ${NC}"
echo ""
plymouthlogo
# grant previleges
echo -e " ${lightgreen} - Grant privileges.${NC}"
echo ""
grantprivs
echo ""
echo ""
echo -e "${lightred} - More Info on https://github.com/horvan/drubuntu/wiki ${NC}"
echo ""
echo ""
echo -e " ${lightgray} - Cleaning up ${NC}"
clean


exit
