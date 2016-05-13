
#!/bin/bash
if [ "$LANG" == "de_DE.UTF-8" ];then
source $PWD/de.sh
else
source $PWD/en.sh
fi
source $PWD/colors.sh
source $PWD/functions.sh
source $PWD/filetemplates.sh
dlbase()
{
echo""
echo -ne '                      (0%)\r'
aptprogress
echo -ne '######                                                                                         (10%)\r'
getcorepkgs
echo -ne '################                                                                                (20%)\r'
getcomposer
echo -ne '##########################                                                                      (30%)\r'
getdrush
echo -ne '##############################################                                                  (50%)\r'
uploadprogress
echo -ne '########################################################                                        (60%)\r' 
getgems
echo -ne '##################################################################                              (70%)\r'
sleep 1
echo -ne '############################################################################                    (80%)\r'
sleep 1
echo -ne '######################################################################################          (90%)\r'
sleep 1
echo -ne '################################################################################################ (100%)\r'
echo -ne '\n'
sleep 3
}
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
echo ""
echo -e " ${lightgreen} ${heightfin} ${createdirmsg} ${NC}"
echo ""
mkdirs
#virtual platformtools
echo -e " ${purple} ${heightfin} ${vmtoolsmssg} ${NC}"
echo ""
vtoolscheck
#package installation
echo -e " ${lightgreen} ${heightfin} ${dlbcmssg} ${NC}"
dlbase
echo ""

echo -e " ${green} ${heightfin} ${aptupdatemssg} ${NC}"
echo ""
echo -e " ${lightgreen} ${heightfin} ${createdirmsg} ${NC}"
echo ""
#virtual platformtools
echo -e " ${purple} ${heightfin} ${vmtoolsmssg} ${NC}"
echo ""
#package installation
echo -e " ${lightgreen} ${heightfin} ${dlbcmssg} ${NC}"
echo ""
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
echo -e " ${yellow} ${heightfin} ${plymoutlogomssg} ${NC}"
plymouthlogo
# grant previleges
echo -e " ${lightgreen} ${heightfin} ${grantprvsmssg} ${NC}"
grantprivs
echo -e "${lightred} ${heightfin}  ${infomssg}   ${NC}"
echo ""
echo -e " ${lightgray} ${heightfin} ${clngnmssg} ${NC}"
clean
chhostname
exit
