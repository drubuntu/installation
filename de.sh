#!/bin/bash

# welcom messages
heightfin="-"
wcmssg1="Willkommen zum Setup von Drubuntu!"
wcmssg2="Dieser Assistent richtet Drubuntu für Sie vollautomatisch ein." 
wcmssg3="Dies ist nur die Basisinstallation. Weitere  Funktionen fügen Sie später hinzu."

#messages acording to the file system
aptupdatemssg="Ubuntus Paketquellen werden aktualisiert ..."
dlbcmssg="Drubuntu lädt  Basiskomponenten herunter, dies kann etwas dauern ..."
createdirmsg="Verzeichnisse werden erstellt ..."
createfilesmsg="Dateien werden angelegt ..."
plymoutlogomssg="Boot Logo wird heruntergeladen ubnd installiert"
vmtoolsmssg="Die Treiber Ihrer Virtualisierungssofware wrden installiert..."
vmtoolsaimssg="Die aktuellste Treiberversion ist bereits installiert!"
createsymlinksmssg="Die symbolischen Verknüpfungen in Ihrem Heimatverzeichnis werden erstellt ..."
grantprvsmssg="Rechte werden gesetzt ..."
clngnmssg="Aufräumen"
#LAMP
ap2setupmssg="Appache 2 wird für Drupal vorbereitet ..."
createmysqldbmssg="MySql Datenbank wird erstellt ..."

#Drupal
d7installmssg="Drupal 7 wird installiert ..."
d8installmssg="Drupal 8 wird installiert ..."
drushinstallmssg="Drush wird installiert ..."
createusermssg="Benutzer wird erstellt"

#user account
userdatamssg="Wir benötigen nun einige Angaben von Ihnen"
enterusernamemmssg="Geben Sie Ihrenb gewünschten Nutzername an und dücken Sie [ENTER]: "
disablerootmssg="Root-Konto wird deaktiviert"
runasrootmssg="Zur Ausführung dieses Scripts werden Super-User-Rechtee benötigt. Bitte verwenden Sie sudo!"
roothintmssg="Sie sind als Root angemeldet. Beantworten Sie die Fragen und melden Sie sich später mit dem gewählten Nutzernamen an!"

#standard messages
aktcmssg="Drücken se eine beliebige Taste um fortzufahren!"
bppmssg="Einen Augebnblick bitte ..."
thanksmssg="Vielen Dank!"

#website hints

infomssg="More Info on https://github.com/horvan/drubuntu/wiki"

#features
apcmssg="Installiert einen alternativen Zwiechenspeicher für PHP."
aptanaidemssg="Installiert Aptana Studio 3."
aptanagitmssg="Installiert Git-Erweiterungen für Aptana Studio 3."
aptanaxdebugmssg="Iinstalliert Xdebug in aptanastudio 3."
atommssg="Installiert GitHubs ATOM-Texteditor."
bootstrapwsassmssg="Installiert Bootstrap3 mit Sass für Derupal 7."
browsersmssg="Installiert viele Verschidene Webbrowser auf einmal."
desktopsmssg="Lässt Sie einen Desktop Ihrer Wahl installieren."
memcachedmssg="Installiert memcahced für Drupal 7."
plymouthmssg="Stellt das Bootlogo wieder her."
proftpdmssg="Installiert den ProFtp Dienst zum Datenaustausch!"
varnishmssg="Installiert Varnish."
webexplangsmssg="Installiert Preprozessoren wie SASS und HAML."
xdebugmssg="Insalliert xdebug für PHP."
shortapcmssg="APC"
shortaptanaidemssh="Aptana Studio 3"
shortaptanaxdebugmssg="XDebug für Aptana Studio 3"
shortatommssg="den Atom Texteditor von GitHub"
shortbootstrapwsassmssg="Bootstrap 3 mit Sass für Dupal 7"
shortbrowsersmssg="verschiedene Webbrowser"
shortdesktopsmssg="die Desktopauswahl"
shortmemcachedmssg="MemCache"
shortplymouthmssg="Das Bootlogo"
shortproftpdmssg="ProFtpd"
shoortvarnishmssg="Varnish"
shortwebexplangsmssg="devierse Preprozessoren"
shortxdebugmssg="XDebug"
needpassmssg="Wir benötigen Ihr Passwort, um"
toyoursystemmssg="auf Ihrem System zu installieren"

#messages not used, yet
wvtumssg="Welche Version von Drupal möchten Sie verwenden?"
drupal7inputdatamssg="Nun benötigen wir einige Angaben für Drupal 7:"
enterd7domainmssg="Geben Sie die Domain für Drupal 7 ein und drücken Sie [ENTER]: "
enterd7dbusermssg="Geben Sie den Namen des Datenbankbenutzers für Drupal 7 an und drücken Sie [ENTER]: "
enterd7dbpassmssg="Geben ise das Passwort für Ihren Drupal 7 Datenbankbenutzer an und drücken Sie [ENTER]: "
drupal7inputdatamssg="Nun benötigen wir einige Daten für Drupal7:"
enterd8domainmssg="Geben Sie die Domain für Drupal 8 an und drüecken Sie [ENTER]: "
enterd8dbusermssg="Geben Sie den Namen Ihres Drupal 8 Datenbanbenutzers an und drücken Sie [ENTER]: "
enterd8dbpassmssg="Geben Sie das Passwort für den Datenbaknutzer von Drupal 8 an und drücken Sie [ENTER]: "
