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
#files and folders affected by installation
query=`dpkg-query -W -f='${Status}'`
ok="install ok"
ap2_cffile_d7=drupal7.conf
ap2_cffile_d8=drupal8.conf
ap2sitedir=/etc/apache2/sites-aviable/
hostsfile=$confdir/hosts
#passwords
mydbuser_dseven=drupal
mydbuser_deight=drupal
mydbpass=drupal


# This command creates the directory structure
mkdirs(){
if ! [ -d $bdir ] ;then
mkdir -p  $bdir  >> /dev/null 2>&1
fi
}
# Get files
getfiles(){

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
apt-progress(){
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

sudo apt-add-repository -y ppa:chris-lea/node.js >>/dev/null 2>&1
}


#These are the basic dependencies to install.
getcorepkgs(){
#mysql-server with preeset password
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password MyRoot'
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password MyRoot'
#reinstall mysql server to preset password
apt  -y -qq remove mysql-server-5.5    >> /dev/null 2>&1
apt  -y -qq install mysql-server-5.5   >> /dev/null 2>&1
#install packages if they are not installed already to make sure it even works without the iso from sourceforge
apt install -qq -y server^ >> /dev/null 2>&1
apt install -qq -y openssh-server^ >> /dev/null 2>&1
apt install -qq -y lamp-server^  >> /dev/null 2>&1

if ! [ `$query` software-properties-common == "$ok" ]  ;then
apt -qq -y install  software-properties-common >> /dev/null 2>&1
fi

if ! [ `$query`  curl == "$ok" ] ;then 
apt -y -qq install curl >> /dev/null 2>&1
fi
if ! [ `$query` php-pear == "$ok" ] ;then
apt install -qq -y php-pear >> /dev/null 2>&1
fi
if ! [ `$query` php5-dev == "$ok" ] ;then
apt install -qq -y php5-dev >> /dev/null 2>&1
fi
if ! [ `$query` php5-curl == "$ok" ] ;then
apt install -qq -y php5-curl >> /dev/null 2>&1
fi
if ! [ `$query` php5-json == "$ok" ] ;then
apt install -qq -y php5-json >> /dev/null 2>&1
fi
if ! [ `$query` php5-gd == "$ok" ] ;then  
apt install -qq -y php5-gd >> /dev/null 2>&1
fi
if ! [ `$query` git == "$ok" ] ;then 
apt install -qq -y git >> /dev/null 2>&1
fi
if ! [ `$query` git-core == "$ok" ] ;then
apt install -qq -y git-core >> /dev/null 2>&1
fi
if ! [ `$query` ruby1.9.1-full == "$ok" ] ;then
apt install -qq -y ruby1.9.1-full >> /dev/null 2>&1
fi
if ! [ `$query` libapache2-mod-php5 == "$ok" ] ;then
apt install -qq -y -qq libapache2-mod-php5 >> /dev/null 2>&1 
fi
if ! [ `$query` php5-mcrypt == "$ok" ] ; then
apt install -qq -y -qq php5-mcrypt >> /dev/null 2>&1
fi

if ! [ `$query` php5-gd == "$ok" ] ; then
apt install -qq -y -qq  php5-gd >> /dev/null 2>&1
fi

if ! [ `$query` php5-dev == "$ok" ]  ; then
apt install -qq -y -qq  php5-dev >> /dev/null 2>&1
fi

if ! [ `$query` make == "$ok" ] ; then
apt install -qq -y make >> /dev/null 2>&1
fi

if ! [ `$query` build-essential == "$ok" ] ;  then
apt -qq -y install  build-essential >> /dev/null 2>&1
fi
if ! [ `$query` nodejs == "$ok" ] ;then
updatenodejs >> /dev/null 2>&1
fi
if ! [ `$query` nodejs-legacy == "$ok" ] ; then
apt install -qq -y nodejs-legacy >> /dev/null 2>&1 
fi
if ! [ `$query` npm == "$ok" ] ;then
apt install -qq -y  npm >> /dev/null 2>&1
fi

}

aptupdate(){
apt update >> /dev/null 2>&1
apt -y  upgrade >> /dev/null 2>&1
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
getdrush(){
composer global require drush/drush:dev-master >> /dev/null 2>&1
#create symlink to make drush work when entering drush in terminal
if [ -f /usr/bin/drush ]; then 
rm /usr/bin/drush;
cd $HOME/.composer/vendor/drush/drush;
ln -s  $PWD/drush /usr/bin/drush
else
cd $HOME/.composer/vendor/drush/drush;
ln -s  $PWD/drush /usr/bin/drush

fi	

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
#Install uploadprogress form pecl
pecl install uploadprogress > /dev/null 2>&1;
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
"$d8dir"/setupsite;
chown -Rh "$nameofuser":www-data /var/www;
chmod 644 "$d8dir"/$htafile;
chmod 644 "$d8defsitedir"/"$d8settingsfile";
chmod 644 "$d8defsitedir"/"$d8settingsfile";
chown -Rh "$nameofuser":www-data "$d8dir";
chmod -R 777 "$d8defsitedir";
chmod -R 777 "$d8transdir"
}

#Section for Apache2 setup
make shure user gts access to www directories
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
	a2dissite 000-default.conf 
}
enablerewrite(){
	a2enmod rewrite 
	service apache2 restart
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
a2ensite "$ap2_cffile_d7" 
else
a2ensite "$ap2_cffile_d7" 
fi
}
ap2_cffile_d7(){
if ! [ -f "$ap2sitedir""$ap2_cffile_d8" ] ;then
crd7cffile;
a2ensite "$ap2_cffile_d8" 
else
a2ensite "$ap2_cffile_d8" 
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
}


plymouthlogo(){
apt-get install -y plymouth-theme-script > /dev/null #installs script plymouth theme to make changes work.
dlurl=https://raw.githubusercontent.com/drubuntu/installation/master/
grubfilesurl=files/grub/
$pllogourl=$dlurl$grubfilesurl
savedir=/opt/.drubuntu/drubuntu/
plymouththemedir=/lib/plymouth/themes/
grubdir=/etc/default/

file1=drubuntu.grub
file2=drubuntu.plymouth
file3=drubuntu.script
file4=grub.file
file5=logo_blurred.png
file6=logo.png
file7=password_field.png
file88=password_field16.png
file9=ubuntu_logo.png
file10=ubuntu_logo16.png
cd /opt/.drubuntu

mkdir "$savedir"
cd "$savedir"
wget $pllogourl$file1 > /dev/null 2>&1	#downloading files
wget $pllogourl$file2 > /dev/null 2>&1
wget $pllogourl$file3 > /dev/null 2>&1
wget $pllogourl$file4 > /dev/null 2>&1
wget $pllogourl$file5 > /dev/null 2>&1
wget $pllogourl$file6 > /dev/null 2>&1
wget $pllogourl$file7 > /dev/null 2>&1
wget $pllogourl$file8 > /dev/null 2>&1
wget $pllogourl$file9 > /dev/null 2>&1
wget $pllogourl$file10 > /dev/null 2>&1

mv grub.file grub
cp -r "$savedir"grub  "$grubdir"				#copy file to /etc/default and replace existing file.
rm "$savedir"$file1
cp -r /opt/.drubuntu/drubuntu /lib/plymouth/themes
rm -r "$savedir"									#removes savedir for cleanup.
cd													#the next line sets up drubuntu plymouth theme as default.
update-alternatives --install /lib/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/drubuntu/drubuntu.plymouth 100 >/dev/null 
update-grub >> /dev/null                                  	#update grub.
update-initramfs -c -k all > /dev/null						#generate new kernel  .
update-initramfs -u -k all > /dev/null
#sudo reboot -p					
}

clean(){
apt -y -qq autoremove >>/dev/null 2>&1
apt -y -qq clean  >>/dev/null 2>&1
dpkg --get-selections | grep -v deinstall > "$bdir"/packages-installed.txt  	
if [-d "$HOME"/tmp ];then
rm - "$HOME"/tmp
fi
if [ -f "/etc/profile.d/run.sh" ]; then
rm "/etc/profile.d/run.sh" 
fi
}
