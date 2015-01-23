#!/bin/bash
source $PWD/colors,sh
if ["$LANGUAGE" == de_DE:];then
source $PWD/de.sh
else
source $PWD/en.sh
fi

if [ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

    echo "Please run this script as root or using sudo"

    exit
4 
fi
platformtest=`dmidecode -s system-product-name`
# This line tells the user the current IP in the network
echo "Here is you IP from eth0:"
echo ""
ifconfig eth0 | ( while read line; do [ "$line" != "${line#inet }" ] && e="${line#inet }" && e="${e%%[ ]*}" && e="${e##*[A-Za-z:]}" && echo "$e" ; done )
echo ""
echo "Let's set up a static ip address for your site"
echo ""
echo "If you are using Virtual Box  We'll set this up automatically"
#this function tells the user to enter the data we need to set a static connection
getinfo(){ 

if [ $platformtest == "VirtualBox" ] ; then
echo "Standard Values for Virutal Box are used:"
echo ""
echo "Address:		192.168.56.101"
echo "netmask:		255.255.255.0"
echo "network:		192.168.56.1"
echo "broadcast:	192.168.56.255 "
else
		 echo ""
		read -p "Enter your ip adress for your server ( example 192.168.253.2 ):" staticip 
		read -p "Enter your network space ( the ipv4 address from windows):" networkpattern
		read -p "Enter the netmask for your network ( example 255.255.255.0):" netmaskpattern
		read -p "Enter your broadcast address ( example 192.168.253.255):" broadcastpattern
		clear
fi
}
	
	
	
writeinterfacefile(){
# This function writes the content between the cat command and EOF in to ubuntu's network interfaces file.

if [ $platformtest == "VirtualBox" ] ;then
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
if [ $platformtest == "VirtualBox" ] ;then
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
if [ $platformtest=="VirtualBox" ] ;then
echo "You are using VirtualBox"
echo "Hit Y for yes all is setted up!"
else
echo "So your settings are:"
echo -n "The second Ip for this machine is:    " 
echo   "$staticip"
echo -n "The network is:                        "
echo   "$networkpattern"
echo -n "Your netmask is:                      "  
echo   "$netmaskpattern"                        
echo -n " Your broadcast address is:            "  
echo   "$broadcastpattern"
echo ""
fi
getinfo

#Here we proof if everything is correct and execute the functions above.
if [ $platformtest=="VirtualBox" ] ;then
echo "If something goes wrong check: http://goo.gl/QR0iju"
addiptohostsfile; writeinterfacefile; exportip;
echo "Your System will restart shortly"
sleep 20
reboot now -p 
else

while true; do
		read -p "Are these informations correct? [y/N]" yn
		case $yn in
[Yy]* ) 
if [ $platformtest == "VirtualBox" ] ;then
echo "If something goes wrong check: http://goo.gl/QR0iju"
addiptohostsfile; writeinterfacefile; exportip;
echo "Your System will restart shortly"
sleep 20
reboot now -p 
else
addiptohostsfile; writeinterfacefile; exportip
echo "The new configuration will be available with next boot!"; 
echo "Don't forget to activate a second adapter in your virtual machine"; 
fi

 ;;
		[Nn]* ) getinfo;;
		* ) echo "Please enter Y or n";;
		esac
	done  
fi
fi
