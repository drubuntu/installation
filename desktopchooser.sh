#!/bin/bash
if ["$LANGUAGE" == de_DE:];then
source $PWD/de.sh
else
source $PWD/en.sh
fi

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
git clone "$repodesktops" .
cd "$bdir/desktops" 

DIRURL=/opt/.drubuntu/desktops

cinnamon=cinnamon.sh
deepin=deepin.sh
e19=enlightenment.sh
evolve=evolve.sh
gnome3=gnome3.sh
kde=kde.sh
lxde=lxde.sh
mate=mate.sh
pantheon=pantheon.sh
unity=unity.sh
xfce=xfce.sh

xsessionpath=/usr/share/xsessions/
xession=$xsessionpath$desktopfile 
lightdmfile=/usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf

clear
#install pre requirements
echo "Install prerequirements ..."
echo ""
echo "LightDM is big, so be patient, please."
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
echo "Drubuntu Desktop Selector"
tput sgr0
 
tput cup 5 19
# Set reverse video mode
tput rev
echo "Choose You're preferred Desktop" 

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
echo "x to exit."

# Set bold mode 
tput bold
tput cup 18 18
echo -n "Enter your choice [1-x]  choice: "
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
