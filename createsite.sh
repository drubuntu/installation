#!/bin/bash
DIRURL=/opt/.drubuntu
source $DIRURL/colors.sh
if [ "$LANG" == "de_DE.UTF-8" ];then
source $DIRURL/de.sh
else
source $DIRURL/en.sh
fi

if [ `whoami` != root ]; then
echo -e " ${lightred}  ${runasrootmssg} ${NC}"
    exit
    4
fi

file="/opt/.drubuntu/secondip"

if ! [ -f "$file" ]
then
    echo -e " ${lightred}  ${runsetipfirstmssg} ${NC}"
    exit
else
   

#declare Variables

#sitename sitename is defined by read -p
#domain domain is also defined by user input trough read -p

createfolder(){
mkdir "/var/www/$dbase/sites/$domainpattern"			#create subdir in sites
mkdir "/var/www/$dbase/sites/$domainpattern/files"		#create files dir for site
mkdir "/var/www/$dbase/sites/$domainpattern/modukes"	#create modulees dir for site
mkdir "/var/www/$dbase/sites/$domainpattern/themes"		#create themes dir for site
chown -Rh $username:www-data "/var/www/$dbase/sites/$domainpattern" #let user and appache2 take ownership of created folders
chmod 777 "/var/www/$dbase/sites/$domainpattern/files"

cp "/var/www/$dbase/sites/default/default.settings.php" "/var/www/$dbase/sites/$domainpattern/settings.php"
}

drupal7(){
dbase="d7"  
read -p " ${entersitenamemssg} " sitename
echo ""
read -p "${entertldmssg} " domain
domainpattern="$sitename.$domain"
aliaspattern=www.$domainpattern
logname=$sitename.log"
aliasfile="$sitename.conf"
errorlogname=$sitename.error.log"

writefile
writetohostsfile
createfolder
activate
exit
}

drupal8(){
dbase="d8"  
read -p "${entersitenamemssg} " sitename
echo " "
read -p "${entertldmssg} " domain
domainpattern="$sitename\.$domain"
aliaspattern=www.$domainpattern
logname=$domainpattern.log"
aliasfile="$sitename.conf"
errorlogname=$domainpattern.error.log"

writefile 
writetohostsfile
createfolder
activate
exit
}

writefile(){
echo "<VirtualHost *:80>"                                                    >/etc/apache2/sites-available/$aliasfile
echo "  ServerAdmin webmaster@localhost"                                    >>/etc/apache2/sites-available/$aliasfile
echo "	ServerName $domainpattern"                                          >>/etc/apache2/sites-available/$aliasfile
echo "	ServerAlias $aliaspattern"                                          >>/etc/apache2/sites-available/$aliasfile
echo ""                                                                     >>/etc/apache2/sites-available/$aliasfile
echo "  	DocumentRoot /var/www/$dbase"                                   >>/etc/apache2/sites-available/$aliasfile
echo "  	<Directory />"                                                  >>/etc/apache2/sites-available/$aliasfile
echo "    		Options FollowSymLinks"                                     >>/etc/apache2/sites-available/$aliasfile
echo "    		AllowOverride All"											>>/etc/apache2/sites-available/$aliasfile 
echo "  		</Directory>"                                               >>/etc/apache2/sites-available/$aliasfile
echo ""																		>>/etc/apache2/sites-available/$aliasfile
echo "  <Directory /var/www/$dbase>"                                        >>/etc/apache2/sites-available/$aliasfile
echo "    Options Indexes FollowSymLinks MultiViews"                        >>/etc/apache2/sites-available/$aliasfile
echo "    AllowOverride All"                                                >>/etc/apache2/sites-available/$aliasfile
echo "    Order allow,deny"                                                 >>/etc/apache2/sites-available/$aliasfile
echo "    allow from all"                                                   >>/etc/apache2/sites-available/$aliasfile
echo "  </Directory>"                                                       >>/etc/apache2/sites-available/$aliasfile
echo " ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/"                             >>/etc/apache2/sites-available/$aliasfile
echo "  <Directory "/usr/lib/cgi-bin">"                                     >>/etc/apache2/sites-available/$aliasfile
echo "    AllowOverride None"                                               >>/etc/apache2/sites-available/$aliasfile
echo "    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch"               >>/etc/apache2/sites-available/$aliasfile
echo "    Order allow,deny"                                                 >>/etc/apache2/sites-available/$aliasfile
echo "    Allow from all"                                                   >>/etc/apache2/sites-available/$aliasfile
echo "  </Directory>"                                                       >>/etc/apache2/sites-available/$aliasfile
echo -n "ErrorLog \${APACHE_LOG_DIR\}"                 						>>/etc/apache2/sites-available/$aliasfile
echo "\$errorlogname"                        								>>/etc/apache2/sites-available/$aliasfile
echo "  # Possible values include: debug, info, notice, warn, error, crit," >>/etc/apache2/sites-available/$aliasfile
echo "  # alert, emerg."                                                    >>/etc/apache2/sites-available/$aliasfile
echo "  LogLevel warn"                                                      >>/etc/apache2/sites-available/$aliasfile
echo ""                                                                     >>/etc/apache2/sites-available/$aliasfile
echo -n "CustomLog \${APACHE_LOG_DIR\}"            							>>/etc/apache2/sites-available/$aliasfile
echo  "\$logname combined"													>>/etc/apache2/sites-available/$aliasfile
echo "</VirtualHost>"                                                       >>/etc/apache2/sites-available/$aliasfile
}

writetohostsfile(){
. /etc/profile.d/drubuntu.sh

if [[ $secondadapter =~ ^[0-9]+\.[0-9]+.[0-9]+.[0-9]+$ ]]; then
    if grep "^$secondadapter[[:space:]]\+[^#]\+" /etc/hosts >/dev/null; then
        exp="s/^\(${secondadapter//./\\.}[[:space:]]\+[^#]\+\)/\1 $domain/"
        sed -i "$exp" /etc/hosts
    else
        echo "$secondadapter $domainpattern" >> /etc/hosts
    fi
else
    echo -e "${lightred}  ${savaluemssg}  \${secondadapter} ${isinvalidemssg} ${NC} ${secondadapter} ${NC}"
fi
local="127.0.0.1"
if [[ $local =~ ^[0-9]+\.[0-9]+.[0-9]+.[0-9]+$ ]]; then
    if grep "^$local[[:space:]]\+[^#]\+" /etc/hosts >/dev/null; then
        exp="s/^\(${local//./\\.}[[:space:]]\+[^#]\+\)/\1 $domain/"
        sed -i "$exp" /etc/hosts
    else
        echo "$local $domainpattern" >> /etc/hosts
    fi
else
    echo -e "${lightred}  ${localvaluemssg}  \${local} ${isinvalidemssg}  ${NC} "
fi
}


activate() {
  a2ensite $sitename
  service apache2 reload
}
echo -e "${lightgreen}  ${siteassistmssg} ${NC}"
echo ""
PS3=' $wvtumssg '
options=("Drupal7" "Drupal8" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Drupal7")
            drupal7
            activate
            ;;
        "Drupal8")
             drupal8
             
            activate
            ;;
            "Quit")
            exit
            ;;
        *) echo "invalid option";;
    esac
done
echo -e "${lightgreen}  ${hosisactivemssg} ${NC}"
 fi 
