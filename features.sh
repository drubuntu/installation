#!/bin/bash
#run script for installation and features integration
source $PWD/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $PWD/de.sh
else
source $PWD/en.sh
fi
function show_help() {							#this is the help text
     
       echo -e " ${white} ${apcswitch} ${doublehighfin}   ${apcmssg} ${NC}"
       echo -e " ${white}  ${aptanaideswitch} ${aptanaidemssg} ${NC}"
       echo -e " ${white}  ${aptanagitswitch} ${aptanagitmssg} ${NC}"
       echo -e " ${white}  ${aptanaxdebugswitch} ${aptanaxdebugmssg} ${NC}"
       echo -e " ${white}  ${atomswitch} ${atommssg} ${NC}"
       echo -e " ${white}  ${bootstrapwithsassswitch} ${bootstrapwsassmssg} ${NC}"
       echo -e " ${white}  ${browsersswitch} ${browsersmssg} ${NC}"
       echo -e " ${white}  ${desktopswitch} ${desktopsmssg} ${NC}"
       echo -e " ${white}  ${memcachedswitch} ${memcachedmssg} ${NC}"
       echo -e " ${white}  ${plymouthswitch} ${plymouthmssg} ${NC}"
       echo -e " ${white}  ${proftpdswitch}${proftpdmssg} ${NC}"  .
       echo -e " ${white}  ${varnishshwitch} ${varnishmssg} ${NC}"
       echo -e " ${white}  ${webexplangsswitch} ${webexplangsmssg} ${NC}"
       echo -e " ${white}  ${xdebugswitch} ${xdebugmssg} ${NC}"

}


if [ `whoami` != root ]; then
       echo -e " ${lightred}  ${runasrootmssg} ${NC}"
    exit
    4
fi
repoinstall="https://github.com/drubutu/install.git"
repofeatures="https://github.com/drubutu/features.git"
repodesktops="https://github.com/drubutu/desktops.git"
fdir="/opt/.drubuntu/features"

if  [  -d "$fdir" ];then
cd "$fdir"
else
git clone "$repofeatures" "$bdir/features" >> /dev/null 2>&1
cd "$fdir" 
fi

case $1 in
    --help)									#this is to display the help text
        show_help
    ;;

    --apc)
echo "We need your password to install apc cache on your system"
sudo bash apc.sh

    ;;

    --aptana)								#the following commands download features install them and remove the files before finishing
echo "We need your password to finish Setup of Aptana Studio:"
sudo bash aptanaide.sh
    ;;
--aptana-git)
echo "We need your password to integrate Git functionality:"
sudo bash aptanagitsupport.sh
    ;;

--aptana-xdebug)
echo "We need your password to integrate Git functionality:"
sudo bash xdebug-aptana.sh
    ;;

--atom)
echo "We need your password to integrate Git functionality:"
sudo bash atom.sh >>/dev/null 2>&1
    ;;



--memcached)
echo "We need your password to install memcached to your system:"
sudo bash memcached.sh
    ;;

--proftpd)
echo "To install ProFTPd enter your password, please."
sudo  bash proftpd.sh
    ;;
    --xdebug)
echo " To install XDebug enter your password, please."
sudo bash xdebug.sh
    ;;
--plymouth)
echo " To install the plymouth theme for drubuntu enter your password, please."
sudo bash plymouthlogo.sh
    ;;
    --webexplangs)
echo "To install the ruby based expression language and processors enter your password, please."
sudo bash webexplangs.sh
    ;;
    --varnish)
echo "To install Varnish on your system enter your password, please."
sudo bash varnish.sh
    ;;
--browsers)
echo "To install the Browser Suite on your system enter your password, please"
sudo bash browsersuite.sh
;;

--bootstrap)
echo "To install the Bootstrap 3 boilerplate with sass on system enter your password, please"
sudo bash bootstrapwithsass.sh
;;

*)
        echo "Run $0 --help"
    ;;
esac
