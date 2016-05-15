#!/bin/bash
#This file contains the variables and functions for drubuntu's  installation.
#Do not change anything here unless you are absolutely shure what you are doing.
#this file is referenced by line 2 in install.
#usergiven vars by install

#localdomain_d7 domain name for the drupal 7 site
#localdomain_d8 domain name for the drupal 8 site
#nameofuser the name of the new user account
#password the password for the now user account
#mydbuser the name of the mysql user for Drupal
#mydbpass the password of the mysql user for Drupal

#Basic Setup Starts here

#Here are some general variables
nameofuser=`logname`
#adding git repository urls to clone
github=https://github.com/drubutu/
repoinstall="$github"install.git
repofeatures="$github"features.git
repodesktops="$github"desktops.git
instrepofolder=$HOME/installation
featuresrepofolder=$HOME/features/
desktopsrepofolder=$HOME/desktops/
bdir=/opt/.drubuntu
drush7dir=/usr/local/bin/drsuh-7
drush8dir=/usr/local/bin/drsuh-8
#files and folders affected by installation
query=`dpkg-query -W -f '${Status}\n'`
ok="install ok installed"
ap2_cffile_d7=drupal7.conf
ap2_cffile_d8=drupal8.conf
ap2sitedir=/etc/apache2/sites-aviable/
hostsfile=$confdir/hosts
#passwords
mydbuser_dseven=drupal
mydbuser_deight=drupal
mydbpass=drupal

#functions to disable/enable CTRL+C
disint(){
# Signal 2 is Ctrl+C
# Okay disable it:
trap '' 2
}
enint(){
#enable it, again
trap 2
}
# This command creates the directory structure
disint
mkdirs(){
if ! [ -d $bdir ] ;then
mkdir -p  $bdir  >> /dev/null 2>&1
fi
}
# Get files
getfiles(){
git clone https://github.com/drubuntu/features "$bdir"/features
mv "$bdir"/features/features.sh "$bdir"/features.sh
#Download files needed by drubuntu to provide functionality.
cp "$instrepofolder"/*.sh "$bdir"
mv "$instrepofolder"/files/quickhelp.txt "$bdir"
chmod +r "$bdir"/quickhelp.txt
#removing files not neccecary
rm "$bdir"/filetemplates.sh
rm "$bdir"/functions.sh
rm "$bdir"/install.sh
rm /etc/issue
chmod +x "$bdir"/*.sh
}

# enable fany apt-progressbar see omgubuntu.co.uk/2014/04/how-to-enable-apt-terminal-progress-bar
aptprogress(){
if ! [ -f /etc/apt/apt.conf.d/99progressbar ];then
echo 'Dpkg::Progress-Fancy "1";' > /etc/apt/apt.conf.d/99progressbar
fi
}
#Determine with Virtual Tools to install Virtual Box or VM Ware
vtoolsinstaller(){
# put the name of the platform into a var and use an if statement to determine witch package to install
    #either virtualbox-guest-x11 or open-vm-tools
    platformtest=`dmidecode -s system-product-name`
    if [ "$platformtest" == "VirtualBox" ] ;then
    apt  install -y -qq virtualbox-guest-x11 virtualbox-guest-dkms >>/dev/null 2>&1
    else
    apt install -y -qq open-vm-tools xserver-xorg-video-vmware  >>/dev/null 2>&1

    fi
    }

vtoolscheck(){
if ! [ -f /usr/bin/vmware-user ];then
vtoolsinstaller
else
echo -e " ${lightred} ${heightfin}  ${vmtoolsaimssg}   ${NC}"
echo ""
fi
}

updatenodejs(){
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt  -y -qq install nodejs >> /dev/null 2>&1
}


#These are the basic dependencies to install.
getcorepkgs(){
#mysql-server with preeset password
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password MyRoot'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password MyRoot'
#reinstall mysql server to preset password
apt  -y -qq remove mysql-server-5.5    >> /dev/null 2>&1
apt -y -qq install software-properties-common >> /dev/null 2>&1
updatenodejs >> /dev/null 2>&1

apt  -y install curl mysql-server libapache2-mod-auth-mysql php5-mysql apache2 apache2-utils libapache2-mod-php5  libssh2-php >> /dev/null 2>&1
apt  -y install -qq php5-gd git git-core ruby1.9.1-full  openssh-server^ php-pear php5-dev php5-curl php5-json php5-mcrypt php5-gd php5-dev make build-essential >> /dev/null 2>&1
apt  -y install -qq nodejs-legacy  >> /dev/null 2>&1
apt -y -qq install gdebi-core >> /dev/null 2>&1

}
aptupdate(){
# all sources to add before update are going here:

apt update >> /dev/null 2>&1
apt -y  full-upgrade >> /dev/null 2>&1
}



#Grand privileges to the initial user to mke shure it is not root
grantprivs(){
 chown -Rh $nameofuser:$nameofuser /opt/.drubuntu
 chown -Rh $nameofuser:www-data /var/www
 chown -Rh $nameofuser:$nameofuser  /home/$nameofuser/.drush
 chown -Rh $nameofuser:$nameofuser  /home/$nameofuser/.composer
 chown -Rh $nameofuser:$nameofuser $HOME
 chmod -R 770  $HOME/*
 }
#drush installation
getcomposer(){
# Composer Global installation
curl -sS https://getcomposer.org/installer | php >> /dev/null 2>&1
mv composer.phar /usr/local/bin/composer >> /dev/null 2>&1
sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
source "$HOME"/.bashrc
}
createdrushcommand()
{
cp files/drush /usr/local/bin/
chmod +x /usr/local/bin/drush	
}

getdrush8(){
mkdir "$drush8dir"
cd "$drush8dir"
composer require drush/drush:8.0.0
ln -s "$drush8dir"/vendor/bin/drush /usr/local/bin/drush8
}
getdrush7()
{
mkdir "$drush7dir"
cd "$drush7dir"
composer require drush/drush:7.x-dev
ln -s "$drush7dir"/vendor/bin/drush /usr/local/bin/drush7	
}
getdrush()
{
createdrushcommand
getdrush8
getdrush7
chmod +x /usr/local/bin/drush
}
#installs preproceccor languages and grunt
getgems(){
updatenodejs  >> /dev/null 2>&1
gem install sass  >> /dev/null 2>&1
gem install compass  >> /dev/null 2>&1
npm install -g grunt-cli >> /dev/null 2>&1
getdrush >> /dev/null 2>&1
}
#make sure that uploadprocess gets loaded by php
uploadprogress(){
#Install uploadprogress form pecl
pecl install uploadprogress > /dev/null 2>&1;
#Check for uploadprogress.so
file="/etc/php5/conf.d/uploadprogress.ini"
if [ -f "$file" ]
then
echo "uploadprogress is already installed"
else
cat << EOFUPROGRESS >> /etc/php5/apache2/conf.d/uploadprogress.ini
	extension=uploadprogress.so
EOFUPROGRESS
fi
}
mycrypt(){
#Check for uploadprogress.so
file="/etc/php5/apache2/conf.d/mycrypt.ini"
if [ -f "$file" ]
then
echo "mycrypt is already installed"
else
ln -s /etc/php5/mods-aviable/mycrypt.ini "$file"
fi
}

#This section contains the MySQL Database creation
#core function to create mysql databases called somewhere else
createdb_d7(){
dbname=drupal7
BTICK='`'
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS ${BTICK}$dbname${BTICK};"
Q2="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON $dbname.* TO "$mydbuser_dseven" @'localhost' IDENTIFIED BY '$mydbpass';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

$MYSQL -uroot -pMyRoot -e "$SQL"
}
createdb_d8() {
dbname=drupal8
BTICK='`'
EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`

Q1="CREATE DATABASE IF NOT EXISTS ${BTICK}$dbname${BTICK};"
Q2="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER ON $dbname.* TO "$mydbuser_deight" @'localhost' IDENTIFIED BY '$mydbpass';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"

$MYSQL -uroot -pMyRoot -e "$SQL"
}
#Downloads drupal core url store

#Downloads Drupal 7 Core and removes the subversion string
d7setup(){
source $bdir/drupalcores.sh
chown -Rh "$nameofuser":www-data "$wwwdir"
mkdir -p  "$d7dir"
wget -O "$bdir"/drupal7.tar.gz $d7core
cd "$bdir"&&tar xvfz "$bdir"/drupal7.tar.gz -C "$d7dir"  >> /dev/null 2>&1
rm "$bdir"/*.tar.gz
cd "$d7dir"
cd drup*;
cp -r "$htafile" "$gitifile" "$d7dir";
cp -r * "$d7dir"
cd "$d7dir"
rm -r drup*;
mkdir .git
echo -n "" >.git/config
mkdir -p "$d7filesdir";
chmod 777 "$d7filesdir";
cp -r "$d7defsitedir""$defsettingsfile" "$d7defsitedir""$dsettingsfile";
chmod 777 "$d7defsitedir""$dsettingsfile";
mv "$bdir"/setupsite-d7.sh "$d7dir"/setupsite  ;
chmod +x "$d7dir"/setupsite;
"$d7dir"/setupsite
chown -Rh "$nameofuser":www-data /var/www;
chmod 644 "$d7dir"/"$htafile";
chmod 644 "$d7defsitedir"/"$defsettingsfile";
chmod 644 "$d7defsitedir"/"$dsettingsfile";
chmod -R 777 "$d7defsitedir"
}
#Downloads current Drupal 8 Core and removes the subversion string
d8setup(){
source $bdir/drupalcores.sh
chown -Rh "$nameofuser":www-data "$wwwdir"
mkdir -p  "$d8dir"
wget -O "$bdir/"drupal8.tar.gz $d8core >> /dev/null 2>&1
cd "$bdir"&&tar xvfz "$bdir/"drupal8.tar.gz -C "$d8dir" >> /dev/null 2>&1
rm "$bdir"/*.tar.gz
cd "$d8dir"
mkdir .git
echo -n "" >.git/config
cd drup*;
cp -r "$htafile"  "$d8dir";
cp -r * "$d8dir"
cd "$d8dir"
rm -r drup*;
mkdir -p  "$d8transdir";
chmod 777 "$d8filesdir";
cp -r "$d8defsitedir""$defsettingsfile" "$d8defsitedir""$dsettingsfile";
cp -r "$d8defsitedir""$ddefsymlfile" "$d8defsitedir""$dsymlfile";
chmod 777 "$d8defsitedir""$dsettingsfile";
chmod 777 "$d8defsitedir""$dsymlfile";
mv "$bdir/"setupsite-d8.sh "$d8dir"/setupsite ;
chmod +x "$d8dir"/setupsite;
bash "$d8dir"/setupsite;
chown -Rh "$nameofuser":www-data /var/www;
chmod 644 "$d8dir"/$htafile;
chmod 644 "$d8defsitedir"/"$d8settingsfile";
chmod 644 "$d8defsitedir"/"$d8settingsfile";
chown -Rh "$nameofuser":www-data "$d8dir";
chmod -R 777 "$d8defsitedir";
chmod -R 777 "$d8transdir"

}

#Section for Apache2 setup
#make shure user gts access to www directories
adusertowwdata() {
usermod -a -G www-data "$nameofuser"
}
#setting up hostname for apache
supressfqdnwarning(){
	echo "ServerName drupal.dev" >> /etc/apache2/apache2.conf
	hostname drupal.dev
}
#disable default apache2 site
ap2_disdefault(){
	a2dissite 000-default.conf  >> /dev/null 2>&1
}
enablerewrite(){
	a2enmod rewrite  >> /dev/null 2>&1
	service apache2 restart >> /dev/null 2>&1
	}
		cphostsfile(){
cp /etc/hosts /etc/hosts.back
}
backuphostfile()
{
  cp -r /etc/hosts /etc/hosts.back
}
ap2_cffile_d8(){
if ! [ -f "$ap2sitedir""$ap2_cffile_d7" ] ;then
crd8cffile;
a2ensite "$ap2_cffile_d7"  >> /dev/null 2>&1
else
a2ensite "$ap2_cffile_d7"  >> /dev/null 2>&1
fi
}
ap2_cffile_d7(){
if ! [ -f "$ap2sitedir""$ap2_cffile_d8" ] ;then
crd7cffile;
a2ensite "$ap2_cffile_d8"  >> /dev/null 2>&1
else
a2ensite "$ap2_cffile_d8"  >> /dev/null 2>&1
fi
}

#delete the dissblefunctions line for drush
prepphpcli(){
pattern=disable_functions
infile="/etc/php5/cli/php.ini"
shift
while [ $# -gt 0 ]; do
    shift
    sed "s/$pattern/#$pattern/" < "$infile"
done
	}

apache2setup(){
backuphostfile
mycrypt
crmodhostfile
supressfqdnwarning
ap2_cffile_d8
ap2_cffile_d7
ap2_disdefault
prepphpcli
adusertowwdata
enablerewrite

}
crsymlinks(){
if [ -f $HOME/public_html ] ;then
rm -r $HOME/public_html
ln -s /var/www $HOME/public_html;
ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/apache2/conf.d/mcrypt.ini
else
ln -s /var/www $HOME/public_html;
fi
if [ -f $HOME/apache2-php.ini ] ;then
rm -r $HOME/apache2-php.ini
ln -s /etc/php5/apache2/php.ini $HOME/apache2-php.ini;
else
ln -s /etc/php5/apache2/php.ini $HOME/apache2-php.ini;
fi
if [ -f $HOME/cli-php.ini ] ;then
rm -r $HOME/cli-php.ini
ln -s /etc/php5/cli/php.ini $HOME/cli-php.ini;
else
ln -s /etc/php5/cli/php.ini $HOME/cli-php.ini;
fi
if [ -f $HOME/my.cnf ] ;then
rm -r $HOME/my.cnf
ln -s /etc/mysql/my.cnf $HOME/my.cnf;
else
ln -s /etc/mysql/my.cnf $HOME/my.cnf;
fi
}

crbinsymlinks(){
cd "$bdir"
ln -s  $PWD/setwallpaper.sh /usr/bin/dru-setwallpaper
ln -s  $PWD/setip.sh /usr/bin/dru-setip
ln -s  $PWD/features.sh /usr/bin/dru-features
ln -s  $PWD/createsite.sh /usr/bin/dru-newsite
ln -s  $PWD/createsubdomain.sh /usr/bin/dru-newsubdomain
ln -s  $PWD/desktopchooser.sh /usr/bin/dru-desktopchooser
ln -s /etc/issue.net /etc/issue
}

elementaryos(){
apt -y install software-properties-common
apt -y install xorg lightdm
apt-add-repository -y ppa:gnome3 &&
apt-add-repository -y ppa:gnome3-team/gnome3-staging &&
apt-add-repository -y ppa:elementary/stable &&
apt-add-repository -y ppa:elementary/os patches &&
apt update &&
apt-get -y --force-yes -qq install elementary-desktop
apt-get -y remove unity-greeter &&
dpg-reconfigure pantheon-greeter &&
apt-get upgrade;apt-get dist-upgrade
}
plymouthlogo(){
apt-get install -y plymouth-theme-script > /dev/null #installs script plymouth theme to make changes work.
dlurl="https://raw.githubusercontent.com/drubuntu/installation/master/"
grubfilesurl=files/grub/
savedir=$instrepofolder/files/grub/
pltheme=$instrepofolder/files/drubuntu
plymouththemedir=/lib/plymouth/themes
grubdir=/etc/default/



				#copy file to /etc/default and replace existing file.
mv "$savedir" "$pltheme"
mv "$pltheme"/grub.file "$grubdir"/grub
cp -r "$pltheme" "$plymouththemedir"  #removes savedir for cleanup.

													#the next line sets up drubuntu plymouth theme as default.
update-alternatives --install /lib/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/drubuntu/drubuntu.plymouth 100 >/dev/null
update-grub >> /dev/null                                  	#update grub.
update-initramfs -c -k all > /dev/null						#generate new kernel  .
update-initramfs -u -k all > /dev/null
#sudo reboot -p
}
chhostname(){
	cat << EOFHOSTNAME > /etc/hostname 
ubuntu
EOFHOSTNAME
}

clean(){
apt -y -qq autoremove >>/dev/null 2>&1
apt -y -qq clean  >>/dev/null 2>&1
dpkg --get-selections | grep -v deinstall > "$bdir"/packages-installed.txt
if [ -d "$HOME"/tmp ];then
rm -r "$HOME"/tmp
fi
if [ -f "/etc/profile.d/run.sh" ]; then
rm "/etc/profile.d/run.sh"
fi
enint
}
