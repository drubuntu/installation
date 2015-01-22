#!/bin/bash
if [ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

    echo "Please run this script as root or using sudo"

    exit
4 
fi
string=secondadapter
if  ! grep -Fxq "$string" /etc/profile.d/drubuntu.sh;
then
    echo "Rrun 'dru-setip' first, please!"
    exit
else
writedomainfile(){
echo "<VirtualHost *:80 >"                                                      >/etc/apache2/sites-available/$domain
echo "      DocumentRoot /var/www/$dbase/"                                >>/etc/apache2/sites-available/$domain
echo "       ServerName $domain"                                          >>/etc/apache2/sites-available/$domain
echo ""                                                                   >>/etc/apache2/sites-available/$domain
echo "       <Directory /var/www/$dbase/>"                                >>/etc/apache2/sites-available/$domain
echo "               Options Indexes FollowSymLinks MultiViews +Includes" >>/etc/apache2/sites-available/$domain
echo "               AllowOverride All"                                   >>/etc/apache2/sites-available/$domain
echo "               Order allow,deny"                                    >>/etc/apache2/sites-available/$domain
echo "               allow from all"                                      >>/etc/apache2/sites-available/$domain
echo "       </Directory>"                                                >>/etc/apache2/sites-available/$domain
echo "</VirtualHost>"													  >>/etc/apache2/sites-available/$domain
}

writetohostsfile(){
. /etc/profile.d/drubuntu.sh

if [[ $secondadapter =~ ^[0-9]+\.[0-9]+.[0-9]+.[0-9]+$ ]]; then
    if grep "^$secondadapter[[:space:]]\+[^#]\+" /etc/hosts >/dev/null; then
        exp="s/^\(${secondadapter//./\\.}[[:space:]]\+[^#]\+\)/\1 $domain/"
        sed -i "$exp" /etc/hosts
    else
        echo "$secondadapter $domain" >> /etc/hosts
    fi
else
    echo "Value of \$secondadapter is invalid: $secondadapter"
fi
local="127.0.0.1"
if [[ $local =~ ^[0-9]+\.[0-9]+.[0-9]+.[0-9]+$ ]]; then
    if grep "^$local[[:space:]]\+[^#]\+" /etc/hosts >/dev/null; then
        exp="s/^\(${local//./\\.}[[:space:]]\+[^#]\+\)/\1 $domain/"
        sed -i "$exp" /etc/hosts
    else
        echo "$local $domain" >> /etc/hosts
    fi
else
    echo "Value of \$local is invalid: $local"
fi
}


activate() {
a2ensite $domain
  service apache2 reload
}

drupal7(){
dbase="d7"  
read -p "Enter your projects domain like sub.project.tdl, please " domain

writedomainfile
writetohostsfile

}

drupal8(){
dbase="8"  
read -p "Enter your projects domain like sub.project.tdl, please " domain

writedomainfile
writetohostsfile
}

echo "With this assistant it is possible to create a new domain/site with a selected drupal code base"
echo ""

PS3='With version of drupal do you like to use? '
options=("Drupal7" "Drupal8" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Drupal7")
            drupal7
            activate
            exit
            ;;
        "Drupal8")
             drupal8 
            activate
            exit
            ;;
            "Quit")
            exit
            ;;
        *) echo "invalid option";;
    esac
done
echo " Your new Host is activated now"
fi