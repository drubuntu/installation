#!/bin/bash
#run script for installation and features integration
bdir="/opt/.drubuntu"
cd ${0%/*}
source $bdir/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $bdir/de.sh
else
source $bdir/en.sh
fi




if [ `whoami` != root ]; then
echo -e " ${white}  ${runhlpmssg} ${NC}"
echo -e " ${lightred}  ${runasrootmssg} ${NC}"
    exit
    4
fi
DIRURL=/opt/.drubuntu/features/
DLURL=https://raw.githubusercontent.com/drubuntu/features/master/
AGENT="User-Agent: Mozilla/5.0 (Linux; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
apc="$DLURL"apc.sh
aptanagitsupport="$DLURL"aptanagitsupport.sh
aptanaide="$DLURL"aptanaide.sh
aptanaxdebug="$DLURL"aptanaxdebug.sh
atom="$DLURL"atom.sh
bootstrapwithsass="$DLURL"bootstrapwithsass.sh
browsersuite="$DLURL"browsersuite.sh
memcached="$DLURL"memcached.sh
plymouthlogo="$DLURL"plymouthlogo.sh
proftpd="$DLURL"proftpd.sh
shelled="$DLURL"shelled.sh
varnish="$DLURL"varnish.sh
webexplangs="$DLURL"webexplangs.sh
xdbug="$DLURL"xdbug.sh
function download(){
curl -Ls -A "$AGENT" -O $apc 
curl -Ls -A "$AGENT" -O $aptanagitsupport 
curl -Ls -A "$AGENT" -O $aptanaide 
curl -Ls -A "$AGENT" -O $atom 
curl -Ls -A "$AGENT" -O $bootstrapwithsass 
curl -Ls -A "$AGENT" -O $memcached 
curl -Ls -A "$AGENT" -O $plymouthlogo 
curl -Ls -A "$AGENT" -O $proftpd 
curl -Ls -A "$AGENT" -O $shelled 
curl -Ls -A "$AGENT" -O $varnish 
curl -Ls -A "$AGENT" -O $webexplangs 
curl -Ls -A "$AGENT" -O $aptanaxdbug 
curl -Ls -A "$AGENT" -O $xdbug 
}

if ! [  -d "$DIRURL" ];then
mkdir -p "$DIRURL" 
else
rm -r "$DIRURL"
mkdir -p "$DIRURL"
fi
download
function show_help() {							#this is the help text
     
       echo -e " ${white}  ${apcswitch}                ${apcmssg} ${NC}"
       echo -e " ${white}  ${aptanaideswitch}          ${aptanaidemssg} ${NC}"
       echo -e " ${white}  ${aptanagitswitch}          ${aptanagitmssg} ${NC}"
       echo -e " ${white}  ${aptanaxdebugswitch}       ${aptanaxdebugmssg} ${NC}"
       echo -e " ${white}  ${atomswitch}               ${atommssg} ${NC}"
       echo -e " ${white}  ${bootstrapwithsassswitch}  ${bootstrapwsassmssg} ${NC}"
       echo -e " ${white}  ${browserswitch}           ${browsersmssg} ${NC}"
       echo -e " ${white}  ${desktopswitch}            ${desktopsmssg} ${NC}"
       echo -e " ${white}  ${memcachedswitch}          ${memcachedmssg} ${NC}"
       echo -e " ${white}  ${plymouthswitch}           ${plymouthmssg} ${NC}"
       echo -e " ${white}  ${proftpdswitch}            ${proftpdmssg} ${NC}"  .
       echo -e " ${white}  ${varnishshwitch}           ${varnishmssg} ${NC}"
       echo -e " ${white}  ${webexplangsswitch}        ${webexplangsmssg} ${NC}"
       echo -e " ${white}  ${xdebugswitch}             ${xdebugmssg} ${NC}"
}
case $1 in
    --help)								
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

--aptanaxdebug)
echo -e " ${white}  ${needpassmssg} ${shortaptanaxdvugmssg} ${toyoursystemmssg} ${NC}"
sudo bash aptanaxdbug.sh
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
    echo -e " ${white}  ${runhlpmssg} ${NC}"
    ;;
esac
