#!/bin/bash
#run script for installation and features integration
bdir="/opt/.drubuntu"
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
aptanagit="$DLURL"aptanagitsupport.sh
aptanaide="$DLURL"aptanaide.sh
aptanaxdebug="$DLURL"aptanaxdebug.sh
atom="$DLURL"atom.sh
bootstrap="$DLURL"bootstrapwithsass.sh
browsers="$DLURL"browsersuite.sh
memc="$DLURL"memcached.sh
pllogo="$DLURL"plymouthlogo.sh
pftpd="$DLURL"proftpd.sh
shed="$DLURL"shelled.sh
vnsh="$DLURL"varnish.sh
webex="$DLURL"webexplangs.sh
xdbug="$DLURL"xdebug.sh
function download(){
echo -e "${lightgreen} ${fetchfeaturesssg} ${NC}"
curl -A "$AGENT" -s  -o "$DIRURL"apc.sh "$apc"
curl -A "$AGENT" -s  -o "$DIRURL"aptanagitsupport.sh "$aptanagit"
curl -A "$AGENT" -s  -o "$DIRURL"aptanaide.sh "$aptanaide"
curl -A "$AGENT" -s  -o "$DIRURL"aptanaxdebug.sh "$aptanaxdebug"
curl -A "$AGENT" -s  -o "$DIRURL"atom.sh "$atom"
curl -A "$AGENT" -s  -o "$DIRURL"bootstrapwithsass.sh "$bootstrap"
curl -A "$AGENT" -s  -o "$DIRURL"browsersuite.sh "$browsers"
curl -A "$AGENT" -s  -o "$DIRURL"memcached.sh "$memc"
curl -A "$AGENT" -s  -o "$DIRURL"plymouthlogo.sh "$pllogo"
curl -A "$AGENT" -s  -o "$DIRURL"proftpd.sh "$pftpd"
curl -A "$AGENT" -s  -o "$DIRURL"shelled.sh "$shed"
curl -A "$AGENT" -s  -o "$DIRURL"varnish.sh "$vnsh"
curl -A "$AGENT" -s  -o "$DIRURL"webexplangs.sh "$webex"
curl -A "$AGENT" -s  -o "$DIRURL"xdebug.sh "$xdbug"


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

sudo bash "$DIRURL"/apc.sh

    ;;

    --aptana)								#the following commands download features install them and remove the files before finishing
echo -e " ${white}  ${needpassmssg} ${shortaptanaidemssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"aptanaide.sh
    ;;
--aptana-git)
echo -e " ${white}  ${needpassmssg} ${shortaptanagitmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"aptanagitsupport.sh
    ;;

--aptanaxdebug)
echo -e " ${white}  ${needpassmssg} ${shortaptanaxdvugmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"aptanaxdbug.sh
    ;;

--atom)
echo -e " ${white}  ${needpassmssg} ${shortatommssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"/atom.sh >>/dev/null 2>&1
    ;;



--memcached)
echo -e " ${white}  ${needpassmssg} ${shortmemcachedmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"memcached.sh
    ;;

--proftpd)
echo -e " ${white}  ${needpassmssg} ${shortüroftpdmssg} ${toyoursystemmssg} ${NC}"
sudo  bash "$DIRURL"proftpd.sh
    ;;
    --xdebug)
echo -e " ${white}  ${needpassmssg} ${shortxdebugmssg} ${toyoursystemmssg} ${NC}"
sudo bash xdebug.sh
    ;;
--plymouth)
echo -e " ${white}  ${needpassmssg} ${shortplymouthmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"plymouthlogo.sh
    ;;
    --webexplangs)
echo -e " ${white}  ${needpassmssg} ${shortwebexplangsmssg} ${toyoursystemmssg} ${NC}"
sudo bash webexplangs.sh
    ;;
    --varnish)
echo -e " ${white}  ${needpassmssg} ${shortvarnishmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"varnish.sh
    ;;
--browsers)
echo -e " ${white}  ${needpassmssg} ${shortbrowsersmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"browsersuite.sh
;;

--bootstrap)
echo -e " ${white}  ${needpassmssg} ${shortshortbootstrapwsassmssgmssg} ${toyoursystemmssg} ${NC}"
sudo bash "$DIRURL"bootstrapwithsass.sh
;;

*)
    echo -e " ${white}  ${runhlpmssg} ${NC}"
    ;;
esac
