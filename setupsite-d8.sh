cd ${0%/*}
drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal8 --db-su=root --db-su-pw=MyRoot --account-pass=123456 --site-name="Drupal" >>/dev/null 1>&2;
drush -y dl smtp-8.x-1.x-dev >>/dev/null 1>&2
exit
