#!/bin/bash
if [ `whoami` != root ]; then
    echo "Please run this script as root or using sudo"
    exit
    4
fi
DIRURL=/opt/.drubuntu/
dsurl=https://raw.githubusercontent.com/horvan/drubuntu/master/features/desktops/
cinnamon="$dsurl"cinnamon.sh
deepin="$dsurl"deepin.sh
e19="$dsurl"enlightenment.sh
evolve="$dsurl"evolve.sh
gnome3="$dsurl"gnome3.sh
kde="$dsurl"kde.sh
lxde="$dsurl"lxde.sh
mate="$dsurl"mate.sh
pantheon="$dsurl"pantheon.sh
unity="$dsurl"unity.sh
xfce="$dsurl"xfce.sh
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

				wget "$cinnamon" >> /dev/null 2>&1
				sudo bash "$DIRURL"cinnamon.sh 
        show_menu;
        ;;

        
        2) clear;
			    wget  "$e19" >>/dev/null 2>&1
			    sudo bash "$DIRURL"enlightenment.sh
           show_menu;
            ;;

        

        3) clear;
		    	wget "$gnome3"  >> /dev/null 2>&1
		    	sudo bash "$DIRURL"gnome3.sh
           show_menu;           
;;

	4) clear;
			wget "$kde" >> /dev/null 2>&1
			sudo bash "$DIRURL"kde.sh 
 show_menu;            
;;

	5) clear;
			wget "$lxde" >> /dev/null 2>&1
			sudo bash "$DIRURL"lxde.sh 
  show_menu;
            ;;
    
    	6) clear;
	    		wget "$mate" >> /dev/null 2>&1
	    		sudo bash "$DIRURL"mate.sh
       show_menu;
            ;;
         
    	7) clear;
	    		wget "$pantheon"  >> /dev/null 2>&1
	    		sudo bash "$DIRURL"pantheon.sh
       show_menu;
            ;;
    
	8) clear;
	    		wget "$unity"  >> /dev/null 2>&1
	    		sudo bash "$DIRURL"unity.sh
       show_menu;
            ;;
    
 	9) clear;
	    		wget "$xfce"  >> /dev/null 2>&1
	    		sudo bash "$DIRURL"xfce.sh
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
