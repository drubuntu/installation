#!/bin/bash
#These file provides functions for file creation while the installation is running and if you like to set up new domains and sub domains.
#Do not delete this file, please.

#drubuntus issue is create here

crissue(){
cat << EOF1 > /etc/issue
Drbuntu is powered by Ubuntu 14.04 \n \l

For more information about drubuntu go to https://horvan.github.io/horvan/drubuntu
and use the GitHub Wiki at https://github.com/horvan/drubuntu/wiki
or contact us via Google+ at +drubuntuinfo.  
EOF1
}

craliasfile(){
cat <<EOF20>>~/.bash_aliases	
#!bin/bash
#drubuntu aliases
#system repair commands
alias dru-system-repair="sudo apt-get autoclean; sudo apt-get -y autoremove; sudo dpkg -y --clear-avail; sudo apt-get update; sudo apt-get -y dist-upgrade"
#All variables and commands from here added by the installer. automaticly.
drubaseidir=/opt/.drubuntu
scrdir="$drubaseidir"/scripts/
drfeatures="$scrdir"features
drcreatesite="$scrdir"createsite
drcreatesubdomain="$scrdir"ceatesubdomain
drsetip="$scrdir"setip
drupdate="$scrdir"/update
#features
alias dru-features='bash "$drfeatures" --help'
alias dru-install-plymouthlogo='bash "$drfeatures" --plymouth'
alias dru-install-ftp='bash $drfeatures --proftpd'
alias dru-install-webexplangs='bash $drfeatures --webexplangs'
alias dru-install-aptana='bash $drfeatures --aptana'
alias dru-install-aptanagit='bash $drfeatures --aptana-git'
alias dru-install-aptanaxdebug='bash $drfeatures --aptana-xdebug'
alias dru-install-xdebug='bash $drfeatures --xdebug'
alias dru-install-desktops='bash $drfeatures --desktops'
alias dru-install-browsers='bash $drfeatures --browsers'
alias dru-install-atom='bash $drfeatures --atom'
#help
alias dru-quickhelp="more "$drubasedir"quickhelp.txt"
#scripts
alias dru-addsite='sudo bash $drcreatesite'
alias dru-addsubdomain='sudo bash $drcreatesubdomain'
alias dru-update='sudo bash $drupdate'
alias dru-setip='sudo bash $drsetip'
#aliases without scripts
alias dru-install-phpmyadmin="sudo apt-get install phpmyadmin"
alias dru-mysql-secure="mysql_secure_installation"
alias dru-set-publichtml-default="echo 'cd public_html'>>~/.bashrc"
EOF20
}

#Drubuntus internal profile.d file is created here.

crprofiledfile(){
cat << EOF2 >>/etc/profile.d/drubuntu.sh
#!bin/bash
#This file holds all common variables for your installation of drubuntu. they are accessable  in every userprofile 
EOF2
}

#Creates Drupal 7 Apache2 conf in /etc/apache2/sites-available
crd7cffile(){
cat << EOF3 > /etc/apache2/sites-available/drupal7.conf
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	ServerName drupal7.dev
	ServerAlias www.drupal7.dev

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/d7

  # Indexes + Directory Root.
        DocumentRoot /var/www/d7/

         <Directory /var/www/d7/>
                DirectoryIndex index.php
                Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
        </Directory>

        # Logfiles  
        ErrorLog /var/log/apache2/drupal7-error.log
        CustomLog /var/log/apache2/drupal7-access.log common
	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF3
}

#Creates Drupal 8 Apache2 conf in /etc/apache2/sites-available
crd8cffile(){
cat << EOF4 > /etc/apache2/sites-available/drupal8.conf
<VirtualHost *:80>
	# The ServerName directive sets the request scheme, hostname and port that
	# the server uses to identify itself. This is used when creating
	# redirection URLs. In the context of virtual hosts, the ServerName
	# specifies what hostname must appear in the request's Host: header to
	# match this virtual host. For the default virtual host (this file) this
	# value is not decisive as it is used as a last resort host regardless.
	# However, you must set it for any further virtual host explicitly.
	ServerName drupal8.dev
    	ServerAlias www.drupal8.dev

	ServerAdmin webmaster@localhost
	DocumentRoot /var/www/d8

  # Indexes + Directory Root.
        DocumentRoot /var/www/d8/

        <Directory /var/www/d8/>
                DirectoryIndex index.php
                Options Indexes FollowSymLinks
                AllowOverride All
                Require all granted
        </Directory>

        # Logfiles
        ErrorLog /var/log/apache2/drupal8-error.log
        CustomLog /var/log/apache2/drupal8-access.log common
	# For most configuration files from conf-available/, which are
	# enabled or disabled at a global level, it is possible to
	# include a line for only one particular virtual host. For example the
	# following line enables the CGI configuration for this host only
	# after it has been globally disabled with "a2disconf".
	#Include conf-available/serve-cgi-bin.conf
</VirtualHost>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet
EOF4
}
#Creates hosts file while installation to make sure drupal7.dev and drupal8.dev are with us right from the start
crmodhostfile(){
cat << EOF5 > /etc/hosts
127.0.0.1	drupal.dev ubuntu localhost drupal7.dev www.drupal7.dev drupal8.dev www.drupal8.dev
127.0.1.1	drupal.dev ubuntu  

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
EOF5
}

