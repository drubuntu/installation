#!/bin/bash
drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal7 --db-su=root --db-su-pw=MyRoot --account-pass=123456 --site-name="Drupal" >>/dev/null 1>&2;
drush -y dl l10n_update drush_language smtp >>/dev/null 1>&2
exit
