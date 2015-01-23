#!/bin/bash
bdir="/opt/.drubuntu"
cd ${0%/*}
source $bdir/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $bdir/de.sh
else
source $bdir/en.sh
fi

if [ `whoami` != root ]; then
   echo -e " ${lightred} ${heightfin} ${runasrootmssg} ${NC}"
    exit
    4
fi
DIRURL=/opt/.drubuntu/desktops/
DLURL=https://raw.githubusercontent.com/drubuntu/desktops/master/

if  [  -d "$DIRURL" ];then
mkdir -p "$DIRURL" "$cinnamon"
wget -O "$DIRURL" "$depin"
wget -O "$DIRURL" "$e19"
wget -O "$DIRURL" "$evolve"
wget -O "$DIRURL" "$gnome3"
wget -O "$DIRURL" "$kde"
wget -O "$DIRURL" "$lxde"
wget -O "$DIRURL" "$mate"
wget -O "$DIRURL" "$pantheon"
wget -O "$DIRURL" "$unity"
wget -O "$DIRURL" "$xfce"

else
git clone "https://github.com/drubutu/desktops.git" "$DIRURL" >> /dev/null 2>&1
cd "$DIRURL" 
fi


cinnamon=$"DLURL"cinnamon.sh
deepin="DLURL"deepin.sh
e19="DLURL"enlightenment.sh
evolve="DLURL"evolve.sh
gnome3="DLURL"gnome3.sh
"DLURL"kde="DLURL"kde.sh
lxde="DLURL"lxde.sh
mate="DLURL"mate.sh
pantheon="DLURL"pantheon.sh
unity="DLURL"unity.sh
xfce="DLURL"xfce.sh

xsessionpath=/usr/share/xsessions/
xession=$xsessionpath$desktopfile 
lightdmfile=/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf

clear
#install pre requirements
echo -e " ${lightgreen}  ${prerequmssg} ${NC}"
echo ""
echo -e " ${orange}  ${lightdmmmsg} ${NC}"
apt -y  -qq install software-properties-common ppa-purge xorg >>/dev/null  2>&1
add-apt-repository -y ppa:lightdm-gtk-greeter-team/stable >>/dev/null  2>&1
apt update >>/dev/null  2>&1
apt -y -qq install lightdm-gtk-greeter
clear
cd "$PWD"
show_menu(){
 
# clear the screen
tput clear
tput setab 4
# Move cursor to screen location X,Y (top left is 0,0)
tput cup 3 19
 
# Set a foreground colour using ANSI escape
tput setaf 7
echo -e " ${blue}  ${desktopchoosermssg} ${NC}"
tput sgr0
 
tput cup 5 19
# Set reverse video mode
tput rev
echo -e " ${red}  ${choosedesktopmssg} ${NC}"

tput sgr0
 
tput cup 7 18
echo "1. Cinnamon (Linux Mint)"

tput cup 8 18
echo "2. Enlightenment"

tput cup 9 18
echo "3. Gnome 3"

tput cup 10 18
echo "4. KDE"

tput cup 11 18
echo "5. LXDE"

tput cup 12 18
echo "6. Mate"

tput cup 13 18
echo "7. Pantheon"

tput cup 14 18
echo "8. Unity"

tput cup 15 18
echo "9. Xfce"

tput cup 16 18 
echo -e  " ${green}  ${xtoexitmssg} ${NC}"

# Set bold mode 
tput bold
tput cup 18 18
echo -e -n " ${white}  ${choosemssg} ${NC}"
read opt
tput clear
tput sgr0
tput rc
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;

				
				sudo bash "$DIRURL"cinnamon.sh 
        rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF1>>"$lightdmfile"
user-session=cinnamon
EOF1
        
        show_menu;
        ;;

        
        2) clear;
			    
			    sudo bash "$DIRURL"enlightenment.sh
        rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF2>>"$lightdmfile"
user-session=enlightenment
EOF2
        
           show_menu;
            ;;

        

        3) clear;
		    	
		    	sudo bash "$DIRURL"gnome3.sh
    rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF3>>"$lightdmfile"
user-session=gnome
EOF3
               show_menu;           
;;

	4) clear;
			sudo bash "$DIRURL"kde.sh
	rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF4>>"$lightdmfile"
user-session=kde-plasma
EOF4
 
 show_menu;            
;;

	5) clear;
			sudo bash "$DIRURL"lxde.sh 
rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF5>>"$lightdmfile"
user-session=Lubuntu
EOF5
 
 show_menu;
            ;;
    
    	6) clear;
	    		sudo bash "$DIRURL"mate.sh
    rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF6>>"$lightdmfile"
user-session=mate
EOF6
       
    show_menu;
            ;;
         
    	7) clear;
    	    		sudo bash "$DIRURL"pantheon.sh
    rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF7>>"$lightdmfile"
user-session=pantheon
EOF7
    
       show_menu;
            ;;
    
	8) clear;
	    		sudo bash "$DIRURL"unity.sh
        	rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF8>>"$lightdmfile"
user-session=unity
EOF8
    show_menu;
            ;;
    
 	9) clear;
	    		sudo bash "$DIRURL"xfce.sh
        	rm -r 60-lightdm-gtk-greeter.conf 
cat <<EOF9>>"$lightdmfile"
user-session=xfce4
EOF9
    show_menu;
            ;;
    
  


        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
    
        show_menu;
        ;;
    esac
fi
done
