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
DIRURL=/opt/.drubuntu/featurs/
DLURL=https://raw.githubusercontent.com/drubuntu/features/master/
AGENT="User-Agent: Mozilla/5.0 (Linux; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
apc=apc.sh
aptanagitsupport=aptanagitsupport.sh
aptanaide=aptanaide.sh
aptanaxdebug=aptanaxdebug.sh
atom=atom.sh
bootstrapwithsass=bootstrapwithsass.sh
browsersuite=browsersuite.sh
memcached=memcached.sh
plymouthlogo=plymouthlogo.sh
proftpd=proftpd.sh
shelled=shelled.sh
varnish=varnish.sh
webexplangs=webexplangs.sh
xdbug=xdbug.sh
function download(){
curl -Ls -A "$AGENT" -O $apc $DLURL
curl -Ls -A "$AGENT" -O $aptanagitsupport $DLURL
curl -Ls -A "$AGENT" -O $aptanaide $DLURL
curl -Ls -A "$AGENT" -O $atom $DLURL
curl -Ls -A "$AGENT" -O $bootstrapwithsass $DLURL
curl -Ls -A "$AGENT" -O $memcached $DLURL
curl -Ls -A "$AGENT" -O $plymouthlogo $DLURL
curl -Ls -A "$AGENT" -O $proftpd $DLURL
curl -Ls -A "$AGENT" -O $shelled $DLURL
curl -Ls -A "$AGENT" -O $varnish $DLURL
curl -Ls -A "$AGENT" -O $webexplangs $DLURL
curl -Ls -A "$AGENT" -O $aptanaxdbug $DLURL
curl -Ls -A "$AGENT" -O $xdbug $DLURL
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
