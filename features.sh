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
bdir="/opt/.drubuntu"
cd "$bdir" 										
git clone "$repofeatures" .
cd "$bdir/features" 
function show_help() {							#this is the help text
    cat << ENDHELP 
--apc                echo -e " ${white} ${apcmssg} ${NC}"
--aptana             echo -e " ${white} ${aptanaidemssg} ${NC}"
--aptana-git         echo -e " ${white} ${aptanagitmssg} ${NC}"
--aptana-xdebug	echo -e " ${white} ${aptanaxdebugmssg} ${NC}"
--atom               echo -e " ${white} ${atommssg} ${NC}"
--bootstrapwithsass	echo -e " ${white} ${bootstrapwsassmssg} ${NC}"
--browsers	       echo -e " ${white} ${browsersmssg} ${NC}"
--desktops           echo -e " ${white} ${desktopsmssg} ${NC}"
--memcached          echo -e " ${white} ${memcachedmssg} ${NC}"
--plymouth           echo -e " ${white} ${plymouthmssg} ${NC}"
--proftpd            echo -e " ${white} ${proftpdmssg} ${NC}"  .
--varnish		echo -e " ${white} ${varnishmssg} ${NC}"
--webexplangs        echo -e " ${white} ${webexplangsmssg} ${NC}"
--xdebug             echo -e " ${white} ${xdebugmssg} ${NC}"
ENDHELP
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

--aptana-xdebug)
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

--bootstrapwithsass)
echo "To install the Bootstrap 3 boilerplate with sass on system enter your password, please"
sudo bash bootstrapwithsass.sh
;;

*)
        echo "Run $0 --help"
    ;;
esac
