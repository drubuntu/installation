
#!/bin/bash
source PWD/colors.sh
source $PWD/functions.sh
source $PWD/filetemplates.sh
if ["$LANGUAGE" == de_DE:];then
source $PWD/de.sh
else
source $PWD/en.sh
fi
#first echo creates space after sudo input
clear
echo ""
echo -e " ${orange}  ${wcmssg1} ${nc}"
echo -e " ${orange}  ${wcmssg2} ${nc}"
echo -e " ${orange}  ${wcmssg3} ${nc}"
echo ""
# > /dev/null to hide the output
#basic setup
echo -e " ${green} ${heightfin} ${aptupdatemssg} ${NC}"
aptupdate
echo -e " ${lightgreen} ${heightfin} ${createdirmsg} ${NC}"
echo ""
mkdirs
#virtual platformtools
echo -e " ${purple} ${heightfin} ${vmtoolsmssg} ${NC}"
echo ""
vtoolscheck
#package installation
echo -e " ${lightgreen} ${heightfin} ${dlbcmssg} ${NC}"
echo ""
apt-progress
getcorepkgs
getcomposer
getdrush
uploadprogress
getgems
#fetch required files
echo -e " ${lightgreen} ${heightfin} ${createfilesmsg} ${NC}"
echo ""
crissue
crprofiledfile
getfiles
#create symbolic links
echo -e " ${lightgreen} ${heightfin} ${createsymlinksmssg} ${NC}"
echo ""
crsymlinks
crbinsymlinks
#setting up server
echo -e " ${lightblue} ${heightfin} ${ap2setupmssg} ${NC}"
echo ""
crd7cffile
echo -e " ${lightblue} ${heightfin} ${createmysqldbmssg} ${NC}"

createdb_d7
d7setup
crd8cffile
createdb_d8
d8setup
apache2setup
echo ""
# last steps
echo -e " ${yellow} ${heightfin} ${ plymoutlogomssg} ${NC}"
echo ""
plymouthlogo
# grant previleges
echo -e " ${lightgreen} ${heightfin} ${grantprvsmssg} ${NC}"
echo ""
grantprivs
echo ""
echo ""
echo -e "${lightred} ${heightfin}  ${infomssg}   ${NC}"
echo ""
echo ""
echo -e " ${lightgray} ${heightfin} ${clngnmssg} ${NC}"
clean
exit
