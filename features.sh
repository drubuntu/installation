#!/bin/bash
#run script for installation and features integration
source $PWD/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $PWD/de.sh
else
source $PWD/en.sh
fi


if [ `whoami` != root ]; then
       echo -e " ${lightred}  ${runasrootmssg} ${NC}"
    exit
    4
fi
github=https://github.com/drubutu/
repoinstall="$github"install.git
repofeatures="$github"features.git
repodesktops="$github"desktops.git
fdir="/opt/.drubuntu/features"
fi
if  [  -d "$fdir" ]
cd "$fdir"
else
git clone "$repofeatures" "$bdir/features"
cd "$fdir" 
fi
function show_help() {							#this is the help text
     
       echo -e " ${white} ${doublehighfin} ${apcswith}   ${apcmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${aptanaideswith} ${aptanaidemssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${aptanagitswith} ${aptanagitmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${aptanaxdebugswitch} ${aptanaxdebugmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${atomswitch} ${atommssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${bootstrapwithsassswitch} ${bootstrapwsassmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${browsersswitch} ${browsersmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${desktopswitch} ${desktopsmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${memcachedswitch} ${memcachedmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${plymouthswitch} ${plymouthmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${proftpdswitch}${proftpdmssg} ${NC}"  .
       echo -e " ${white} ${doublehighfin} ${varnishshwitch} ${varnishmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${webexplangsswitch} ${webexplangsmssg} ${NC}"
       echo -e " ${white} ${doublehighfin} ${xdebugswitch} ${xdebugmssg} ${NC}"

}

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
