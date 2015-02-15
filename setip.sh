#!/bin/bash
vb=VirtualBox
DIRURL=/opt/.drubuntu
source $DIRURL/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $DIRURL/de.sh
else
source $DIRURL/en.sh
fi

if [ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

      echo -e " ${lightred}  ${runasrootmssg} ${NC}"

    exit
4 
fi
function menu(){
	
	if [ "$LANG" ==  "de_DE.UTF-8" ];then
	echo ""
			read -p "Geben Sie die IP für Ihren Server ein " staticip 
		read -p "Geben Se Ihr netzwerk ein (Die Adresse Ihres Host Only Netzwerkadapters  " networkpattern
		read -p "Geben SIe Ihre Netzwerkmaske ein " netmaskpattern
		read -p "Geben Sie den Broadkast ein Die Adresse Ihres Host Only netzwerkadapters (letzter Block 255) " broadcastpattern
		clear
		
		else
	echo ""
		read -p "Enter the ip address of server " staticip 
		read -p "Enter your network " networkpattern
		read -p "Enter your netmask " netmaskpattern
		read -p "Enter the broadcast " broadcastpattern
		clear
		fi
}


platformtest=`dmidecode -s system-product-name`

# This line tells the user the current IP in the network

  echo -e " ${yellow}  ${ipeth0mssg} ${NC}"
echo ""
ifconfig eth0 | ( while read line; do [ "$line" != "${line#inet }" ] && e="${line#inet }" && e="${e%%[ ]*}" && e="${e##*[A-Za-z:]}" && echo "$e" ; done )

echo ""

echo -e " ${lightgreen}  ${setipwcmssg} ${NC}"

echo ""

#this function tells the user to enter the data we need to set a static connection
getinfo(){ 

if  [ "$platformtest" == "$vb" ] ; then
echo -e " ${white}  ${defvbvlsmssg} ${NC}"
echo ""
echo "address:		192.168.56.101"
echo "netmask:		255.255.255.0"
echo "network:		192.168.56.1"
echo "broadcast:	192.168.56.255 "
else
		 menu
fi
}
	
	
	
writeinterfacefile(){
# This function writes the content between the cat command and EOF in to ubuntu's network interfaces file.

if [ "$platformtest" == "$vb" ] ;then
  echo "secondadapter=192.168.56.101" >>/etc/profile.d/drubuntu.sh
  staticip=192.168.56.101
 
 cat << EOF1 > /etc/network/interfaces
  # This file describes the network interfaces available on your system
  # and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp

#Host Only Network Adapter
auto eth1
iface eth1 inet static
address 192.168.56.101
netmask 255.255.255.0
network 192.168.56.1
broadcast 192.168.56.255
EOF1

else

cat << EOF2 > /etc/network/interfaces	
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp
		
#Your static network configuration	
auto eth1
iface eth1 inet static
address  $staticip
network $networkpattern
netmask  $netmaskpattern
broadcast $broadcastpattern
EOF2

fi

}
	
exportip(){ 
if [ "$platformtest" == "$vb" ] ;then
staticip=192.168.56.1
fi
if ! [ /etc/profile.d/drubuntu.sh ] ;then
"secondadapter=$staticip"  >>/etc/profile.d/drubuntu.sh
fi
# Here the static IP is exportet to the profile.d file in /etc/profile.d so that all users and scripts could use it.
profile_file="/etc/profile.d/drubuntu.sh" #defines the path to the profile.d file we create for drubuntu.


if ! grep -q 'secondadapter' "${profile_file}" ; then #add the variable to the profile.d file if it isn't already added. 
echo "secondadapter=$staticip" >> /etc/profile.d/drubuntu.sh
fi
echo $staticip > "/opt/.drubuntu/secondip" # writes the name file as reference for the addsitestohosts.sh script.
}

addiptohostsfile(){ # now we add the second adapter to the hosts file.
sandboxsites=" drupal.dev drupal8.dev www.drupal.dev www.drupal8.dev"
ipandsandboxsites="$staticip $sandboxsites"
if ! grep -q '$staticip' /etc/hosts ; then
echo "${ipandsandboxsites}"  >> /etc/hosts 
fi
}
if [ "$platformtest" -eq "$vb" ] ;then
echo -e " ${white}  ${usingvbmssg} ${NC}"
echo -e " ${white}  ${hitytoconfirmmssg} ${NC}"
echo -e " ${white}  ${ipsetaremssg} ${NC}"
echo -e " ${white}  ${ipmssg} ${NC}"
echo   "$staticip"
echo -e " ${white}  ${nsmssg} ${NC}"
echo   "$networkpattern"
echo -e " ${white}  ${nmmssg} ${NC}"
echo   "$netmaskpattern"                        
echo -e " ${white}  ${bcmssg} ${NC}"             
echo   "     $broadcastpattern"
else
getinfo
fi
#Here we proof if everything is correct and execute the functions above.
if [ "$platformtest" == "$vb" ] ;then
echo -e " ${purple}  ${ifwentwrongipmssg} ${NC}"
addiptohostsfile; writeinterfacefile; exportip;
echo -e " ${lightgreen}  ${rebootmssg} ${NC}"
sleep 20
reboot now -p 
else

while true; do
		read -p "${infocorrectmssg}" yn
		case $yn in
[Yy]* ) 


if [ "$platformtest" == "$vb" ] ;then
echo -e " ${purple}  ${ifwentwrongipmssg} ${NC}"
addiptohostsfile; writeinterfacefile; exportip;
echo -e " ${lightgreen}  ${rebootmssg} ${NC}"
sleep 20
reboot now -p 
else
addiptohostsfile; writeinterfacefile; exportip
echo -e " ${white}  ${avnbmssg} ${NC}" 
echo -e " ${white}  ${dfsamssg} ${NC}" 
fi

 ;;
		[Nn]* ) getinfo;;
		* ) echo -e " ${white}  ${yonmssg} ${NC}" ;;
		esac
	done  
fi
