#!/bin/bash
#run script for installation and features integration
cd ${0%/*}
source $PWD/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $PWD/de.sh
else
source $PWD/en.sh
fi
function show_help() {							#this is the help text
     
       echo -e " ${white}  ${apcswitch}                ${apcmssg} ${NC}"
       echo -e " ${white}  ${aptanaideswitch}          ${aptanaidemssg} ${NC}"
       echo -e " ${white}  ${aptanagitswitch}          ${aptanagitmssg} ${NC}"
       echo -e " ${white}  ${aptanaxdebugswitch}       ${aptanaxdebugmssg} ${NC}"
       echo -e " ${white}  ${atomswitch}               ${atommssg} ${NC}"
       echo -e " ${white}  ${bootstrapwithsassswitch}  ${bootstrapwsassmssg} ${NC}"
       echo -e " ${white}  ${browsersswitch}           ${browsersmssg} ${NC}"
       echo -e " ${white}  ${desktopswitch}            ${desktopsmssg} ${NC}"
       echo -e " ${white}  ${memcachedswitch}          ${memcachedmssg} ${NC}"
       echo -e " ${white}  ${plymouthswitch}           ${plymouthmssg} ${NC}"
       echo -e " ${white}  ${proftpdswitch}            ${proftpdmssg} ${NC}"  .
       echo -e " ${white}  ${varnishshwitch}           ${varnishmssg} ${NC}"
       echo -e " ${white}  ${webexplangsswitch}        ${webexplangsmssg} ${NC}"
       echo -e " ${white}  ${xdebugswitch}             ${xdebugmssg} ${NC}"

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
git clone "$repofeatures" "$fdir" >> /dev/null 2>&1
cd "$fdir" 
fi

case $1 in
    --help)									#this is to display the help text
        show_help
    ;;

    --apc)
echo -e " ${white}  ${needpassmssg} ${shortapcmssg} ${toyoursystemmssg} ${NC}"
sudo bash apc.sh

    ;;

    --aptana)								#the following commands download features install them and remove the files before finishing
echo -e " ${white}  ${needpassmssg} ${shortaptanaidemssg} ${toyoursystemmssg} ${NC}"
sudo bash aptanaide.sh
    ;;
--aptana-git)
echo -e " ${white}  ${needpassmssg} ${shortaptanagitmssg} ${toyoursystemmssg} ${NC}"
sudo bash aptanagitsupport.sh
    ;;

--aptana-xdebug)
echo -e " ${white}  ${needpassmssg} ${shortaptanaxdvugmssg} ${toyoursystemmssg} ${NC}"
sudo bash xdebug-aptana.sh
    ;;

--atom)
echo -e " ${white}  ${needpassmssg} ${shortatommssg} ${toyoursystemmssg} ${NC}"
sudo bash atom.sh >>/dev/null 2>&1
    ;;



--memcached)
echo -e " ${white}  ${needpassmssg} ${shortmemcachedmssg} ${toyoursystemmssg} ${NC}"
sudo bash memcached.sh
    ;;

--proftpd)
echo -e " ${white}  ${needpassmssg} ${shortüroftpdmssg} ${toyoursystemmssg} ${NC}"
sudo  bash proftpd.sh
    ;;
    --xdebug)
echo -e " ${white}  ${needpassmssg} ${shortxdebugmssg} ${toyoursystemmssg} ${NC}"
sudo bash xdebug.sh
    ;;
--plymouth)
echo -e " ${white}  ${needpassmssg} ${shortplymouthmssg} ${toyoursystemmssg} ${NC}"
sudo bash plymouthlogo.sh
    ;;
    --webexplangs)
echo -e " ${white}  ${needpassmssg} ${shortwebexplangsmssg} ${toyoursystemmssg} ${NC}"
sudo bash webexplangs.sh
    ;;
    --varnish)
echo -e " ${white}  ${needpassmssg} ${shortvarnishmssg} ${toyoursystemmssg} ${NC}"
sudo bash varnish.sh
    ;;
--browsers)
echo -e " ${white}  ${needpassmssg} ${shortbrowsersmssg} ${toyoursystemmssg} ${NC}"
sudo bash browsersuite.sh
;;

--bootstrap)
echo -e " ${white}  ${needpassmssg} ${shortshortbootstrapwsassmssgmssg} ${toyoursystemmssg} ${NC}"
sudo bash bootstrapwithsass.sh
;;

*)
        echo "Run $0 --help"
    ;;
esac
