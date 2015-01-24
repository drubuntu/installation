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
echo -e " ${lightred}  ${runasrootmssg} ${NC}"
echo -e " ${white}  ${runhlpmssg} ${NC}"
    exit
    4
fi
fdir="/opt/.drubuntu/features"
DIRURL=/opt/.drubuntu/desktops/
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
if ! [  -d "$DIRURL" ];then
mkdir -p "$DIRURL" 
curl -Ls -A "$AGENT" -O $DLURL$apc
curl -Ls -A "$AGENT" -O $DLURL$aptanagitsupport
curl -Ls -A "$AGENT" -O $DLURL$aptanaide
curl -Ls -A "$AGENT" -O $DLURL$atom
curl -Ls -A "$AGENT" -O $DLURL$bootstrapwithsass
curl -Ls -A "$AGENT" -O $DLURL$memcached
curl -Ls -A "$AGENT" -O $DLURL$plymouthlogo
curl -Ls -A "$AGENT" -O $DLURL$proftpd
curl -Ls -A "$AGENT" -O $DLURL$shelled
curl -Ls -A "$AGENT" -O $DLURL$varnish
curl -Ls -A "$AGENT" -O $DLURL$webexplangs
curl -Ls -A "$AGENT" -O $DLURL$aptanaxdbug
curl -Ls -A "$AGENT" -O $DLURL$xdbug
else
cd "$DIRURL" 
rm *.sh
curl -Ls -A "$AGENT" -O "$DLURL $apc"
curl -Ls -A "$AGENT" -O "$DLURL $aptanagitsupport"
curl -Ls -A "$AGENT" -O "$DLURL $aptanaide"
curl -Ls -A "$AGENT" -O "$DLURL$atom"
curl -Ls -A "$AGENT" -O "$DLURL $bootstrapwithsass"
curl -Ls -A "$AGENT" -O "$DLURL $memcached"
curl -Ls -A "$AGENT" -O "$DLURL $plymouthlogo"
curl -Ls -A "$AGENT" -O "$DLURL $proftpd"
curl -Ls -A "$AGENT" -O "$DLURL $shelled"
curl -Ls -A "$AGENT" -O "$DLURL $varnish"
curl -Ls -A "$AGENT" -O "$DLURL $webexplangs"
curl -Ls -A "$AGENT" -O "$DLURL $xdbug-aptana"
curl -Ls -A "$AGENT" -O "$DLURL $xdbug"
fi
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
wget -O "$DIRURL"apc.sh "$DLUURL"/apc.sh
sudo bash apc.sh

    ;;

    --aptana)								#the following commands download features install them and remove the files before finishing
echo -e " ${white}  ${needpassmssg} ${shortaptanaidemssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"aptana.ide "$DLUURL"/aptanade.sh
sudo bash aptanaide.sh
    ;;
--aptana-git)
echo -e " ${white}  ${needpassmssg} ${shortaptanagitmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"aptanagitsupport.sh "$DLUURL"/aptanagitsupport.sh
sudo bash aptanagitsupport.sh
    ;;

--aptanaxdebug)
echo -e " ${white}  ${needpassmssg} ${shortaptanaxdvugmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"xdebug-aptana "$DLUURL"/xdbug-aptana.sh
sudo bash aptanaxdbug.sh
    ;;

--atom)
echo -e " ${white}  ${needpassmssg} ${shortatommssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"atom.sh "$DLUURL"/atom.sh
sudo bash atom.sh >>/dev/null 2>&1
    ;;



--memcached)
echo -e " ${white}  ${needpassmssg} ${shortmemcachedmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"memcached.sh "$DLUURL"/memcached.sh
sudo bash memcached.sh
    ;;

--proftpd)
echo -e " ${white}  ${needpassmssg} ${shortüroftpdmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"proftpd.sh "$DLUURL"/proftpd.sh
sudo  bash proftpd.sh
    ;;
    --xdebug)
echo -e " ${white}  ${needpassmssg} ${shortxdebugmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"xdebug.sh "$DLUURL"/xdebug.sh
sudo bash xdebug.sh
    ;;
--plymouth)
echo -e " ${white}  ${needpassmssg} ${shortplymouthmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"plymouthlogo.sh "$DLUURL"/plymouthlogo.sh
sudo bash plymouthlogo.sh
    ;;
    --webexplangs)
echo -e " ${white}  ${needpassmssg} ${shortwebexplangsmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"webexplangs.sh "$DLUURL"/webexplangs.sh
sudo bash webexplangs.sh
    ;;
    --varnish)
echo -e " ${white}  ${needpassmssg} ${shortvarnishmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"varnish.sh "$DLUURL"/varnish.sh
sudo bash varnish.sh
    ;;
--browsers)
echo -e " ${white}  ${needpassmssg} ${shortbrowsersmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"browsersuite.sh "$DLUURL"/browsersuite.sh
sudo bash browsersuite.sh
;;

--bootstrap)
echo -e " ${white}  ${needpassmssg} ${shortshortbootstrapwsassmssgmssg} ${toyoursystemmssg} ${NC}"
wget -O "$DIRURL"bootstrapwithsass.sh "$DLUURL"/bootstrapwithsass.sh
sudo bash bootstrapwithsass.sh
;;

*)
    echo -e " ${white}  ${runhlpmssg} ${NC}"
    ;;
esac
