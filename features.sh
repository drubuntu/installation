#!/bin/bash
#run script for installation and features integration
if [ `whoami` != root ]; then
    echo "Please run this script as root or using sudo"
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

*)
        echo "Run $0 --help"
    ;;
esac
