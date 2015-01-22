#!/bin/bash
wwwdir=/var/www
d6dir=/var/www/d6
d7dir=/var/www/d7
d8dir=/var/www/d8
gitifile=.gitignore
htafile=.htaccess
setupd6=setupsite-d6.sh
setupd7=setupsite-d7.sh
setupd8=setupsite-d8.sh
d6defsitedir=$d6dir/sites/default
d7defsitedir=$d7dir/sites/default
d8defsitedir=$d8dir/sites/default
d6filesdir=$d6defsitedir/files
d7filesdir=$d7defsitedir/files
d8filesdir=$d8defsitedir/files
d8transdir=$d8filesdir/translations
defsettingsfile=/default.settings.php
dsettingsfile=/settings.php
ddefsymlfile=/default.services.yml
dsymlfile=/services.yml
d8core=http://ftp.drupal.org/files/projects/drupal-8.0.0-beta4.tar.gz
d7core=http://ftp.drupal.org/files/projects/drupal-7.34.tar.gz
d6core=http://ftp.drupal.org/files/projects/drupal-6.34.tar.gz
