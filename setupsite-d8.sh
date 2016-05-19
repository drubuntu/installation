#!/bin/bash
setfile=/var/www/d8/sites/default/settings.php
defsetfile=/var/www/d8/sites/default/default.settings.php

cd ${0%/*}

 if [[ $EUID -ne 0 ]]; then
 echo "Please run as root"
sudo $0
  else
source $HOME/.bashrc
if [[ -f "$setfile" ]];then
sudo rm "$setfile"
sudo cp -R "$defsetfile" "$setfile"
sudo cat <<EOF >> sites/default/settings.php


\$settings['trusted_host_patterns'] = array(
   '^drupal8\.dev$',
   '^.+\.drupal8\.dev$',
   '^.+\.drupal8\.dev',
   '^localhost$',
   '^localhost\.*',
   '\.local$',
);
EOF
fi

drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal8 --db-su=root --db-su-pw=MyRoot --account-pass=123456 --site-name="Drupal" >>/dev/null 1>&2;
drush -y dl smtp-8.x-1.x-dev >>/dev/null 1>&2
sudo chmod 644 sites/default/services.yml
sudo chmod -R 777 sites/default/files
sudo chmod 644 sites/default/settings.php
fi
drush --version  >> /dev/null 2>&1
git config drush.version 8
drush --version  >> /dev/null 2>&1

