#!bin/bash
source $PWD/colors,sh
if ["$LANGUAGE" == de_DE:];then
source $PWD/de.sh
else
source $PWD/en.sh
fi
if[ `whoami` != root ]; then #checks if the user is root. If The user isn't root the message is printed and the script will be interrupted.

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
read -p "please enter the name of your site without domain and any prefix " sitename
echo ""
read -p "Please enter the domain that you like! Dont enter a dot (.) in front of it " domain
domainpattern="$sitename.$domain"
aliaspattern=www.$domainpattern
logname=$sitename.log"
errorlogname=$sitename.error.log"

writefile
writetohostsfile
createfolder
activate
exit
}

drupal8(){
dbase="d8"  
read -p "Please enter the name of your site without domain and any prefix " sitename
echo ""
read -p "Please enter the domain that you like! Dont enter a dot (.) in front of it " domain
domainpattern="$sitename\.$domain"
aliaspattern=www.$domainpattern
logname=$domainpattern.log"
errorlogname=$domainpattern.error.log"
writefile 
writetohostsfile
createfolder
activate
exit
}

writefile(){
echo "<VirtualHost *:80>"                                                    >/etc/apache2/sites-available/$sitename
echo "  ServerAdmin webmaster@localhost"                                    >>/etc/apache2/sites-available/$sitename
echo "	ServerName $domainpattern"                                          >>/etc/apache2/sites-available/$sitename
echo "	ServerAlias $aliaspattern"                                          >>/etc/apache2/sites-available/$sitename
echo ""                                                                     >>/etc/apache2/sites-available/$sitename
echo "  	DocumentRoot /var/www/$dbase"                                   >>/etc/apache2/sites-available/$sitename
echo "  	<Directory />"                                                  >>/etc/apache2/sites-available/$sitename
echo "    		Options FollowSymLinks"                                     >>/etc/apache2/sites-available/$sitename
echo "    		AllowOverride All"											>>/etc/apache2/sites-available/$sitename 
echo "  		</Directory>"                                               >>/etc/apache2/sites-available/$sitename
echo ""																		>>/etc/apache2/sites-available/$sitename
echo "  <Directory /var/www/$dbase>"                                        >>/etc/apache2/sites-available/$sitename
echo "    Options Indexes FollowSymLinks MultiViews"                        >>/etc/apache2/sites-available/$sitename
echo "    AllowOverride All"                                                >>/etc/apache2/sites-available/$sitename
echo "    Order allow,deny"                                                 >>/etc/apache2/sites-available/$sitename
echo "    allow from all"                                                   >>/etc/apache2/sites-available/$sitename
echo "  </Directory>"                                                       >>/etc/apache2/sites-available/$sitename
echo " ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/"                             >>/etc/apache2/sites-available/$sitename
echo "  <Directory "/usr/lib/cgi-bin">"                                     >>/etc/apache2/sites-available/$sitename
echo "    AllowOverride None"                                               >>/etc/apache2/sites-available/$sitename
echo "    Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch"               >>/etc/apache2/sites-available/$sitename
echo "    Order allow,deny"                                                 >>/etc/apache2/sites-available/$sitename
echo "    Allow from all"                                                   >>/etc/apache2/sites-available/$sitename
echo "  </Directory>"                                                       >>/etc/apache2/sites-available/$sitename
echo -n "ErrorLog \${APACHE_LOG_DIR\}"                 						>>/etc/apache2/sites-available/$sitename
echo "\$errorlogname"                        								>>/etc/apache2/sites-available/$sitename
echo "  # Possible values include: debug, info, notice, warn, error, crit," >>/etc/apache2/sites-available/$sitename
echo "  # alert, emerg."                                                    >>/etc/apache2/sites-available/$sitename
echo "  LogLevel warn"                                                      >>/etc/apache2/sites-available/$sitename
echo ""                                                                     >>/etc/apache2/sites-available/$sitename
echo -n "CustomLog \${APACHE_LOG_DIR\}"            							>>/etc/apache2/sites-available/$sitename
echo  "\$logname combined"													>>/etc/apache2/sites-available/$sitename
echo "</VirtualHost>"                                                       >>/etc/apache2/sites-available/$sitename
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
  a2ensite $sitename
  service apache2 reload
}
echo "With this assistant it is possible to create a new domain/site with a selected drupal code base"
echo ""
PS3='Wich Version of Drupal do you like to use? '
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
echo "Your new host is activated now"
 fi 
