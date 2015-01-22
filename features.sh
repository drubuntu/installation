#!/bin/bash
#run script for installation and features integration
fdlurl=https://raw.githubusercontent.com/horvan/drubuntu/master/features/
bdir="/opt/.drubuntu"
cd "$bdir" 										#to set the scripts directory as working directory.

function show_help() {							#this is the help text
    cat << ENDHELP 
--apc				Installs APC cache for php.
--aptana            Installs Aptana IDE and some components to run it.
--aptana-git        Installs git support in Aptana Studio.
--aptana-xdebug	    Installs PDT in aptana to debug Drupal with Xdebug,
--atom              Installs atom text editor - A modular Aptana Studio alternative
--browsers	        Installs a suite of different web browsers.
--desktops          Installs the desktop chooser.
--memcached         Installs Memcached for you.
--plymouth          Installs the drupalicon as  plymouth theme.
--proftpd           Installs a FTP Server with one preset user.  .
--varnish			Installs Varnish HTTP accellarator.
--webexplangs       Installs serveral ruby gems and thier docomentation.
--xdebug            Installs Xdebug for Drupal.
ENDHELP
}

case $1 in
    --help)									#this is to display the help text
        show_help
    ;;

    --apc)
echo "We need your password to install apc cache on your system"
wget "$fdlurl"apc.sh
sudo bash apc.sh
sudo rm apc.sh
    ;;

    --aptana)								#the following commands download features install them and remove the files before finishing
echo "We need your password to finish Setup of Aptana Studio:"
wget "$fdlurl"aptanaide.sh  >/dev/null 2>&1
sudo bash aptanaide.sh
sudo rm aptanaide.sh
    ;;
--aptana-git)
echo "We need your password to integrate Git functionality:"
wget "$fdlurl"aptanagitsupport.sh  >/dev/null 2>&1
sudo bash aptanagitsupport.sh
sudo rm aptanagitsupport.sh
    ;;

--aptana-xdebug)
echo "We need your password to integrate Git functionality:"
wget "$fdlurl"xdebug-aptana.sh  >/dev/null 2>&1
sudo bash xdebug-aptana.sh
sudo rm xdebug-aptana.sh
    ;;

--aptana-xdebug)
echo "We need your password to integrate Git functionality:"
wget "$fdlurl"atom.sh  >>/dev/null 2>&1
sudo bash atom.sh >>/dev/null 2>&1
sudo rm atom.sh >>/dev/null 2>&1
    ;;



--memcached)
echo "We need your password to install memcached to your system:"
wget "$fdlurl"memcached.sh  >/dev/null 2>&1
sudo bash memcached.sh
sudo rm memcached.sh
    ;;

--proftpd)
echo "To install ProFTPd enter your password, please."
wget "$fdlurl"proftpd.sh  >/dev/null 2>&1
sudo  bash proftpd.sh
sudo rm proftpd.sh
    ;;
    --desktops)
echo " You can Choose your desktop instant. Please enter your password."
wget "$fdlurl"desktopchooser.sh  >/dev/null 2>&1
sudo bash desktopchooser.sh
sudo rm desktopchooser.sh
    ;;
    --xdebug)
echo " To install XDebug enter your password, please."
wget "$fdlurl"xdebug.sh  >/dev/null 2>&1
sudo bash xdebug.sh
sudo rm xdebug.sh
    ;;
--plymouth)
echo " To install the plymouth theme for drubuntu enter your password, please."
wget "$fdlurl"plymouthlogo.sh  >/dev/null 2>&1
sudo bash plymouthlogo.sh
sudo rm plymouthlogo.sh
    ;;
    --webexplangs)
echo "To install the ruby based expression language and processors enter your password, please."
wget "$fdlurl"webexplangs.sh  >/dev/null 2>&1
sudo bash webexplangs.sh
sudo rm webexplangs.sh
    ;;
    --varnish)
echo "To install Varnish on your system enter your password, please."
wget "$fdlurl"varnish.sh  >/dev/null 2>&1
sudo bash varnish.sh
sudo rm varnish.sh
    ;;
--browsers)
echo "To install the Browser Suite on your system enter your password, please"
wget "$fdlurl"browsersuite.sh  >/dev/null 2>&1
sudo bash browsersuite.sh
sudo rm browsersuite.sh
;;

*)
        echo "Run $0 --help"
    ;;
esac
