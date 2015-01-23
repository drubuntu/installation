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
roothintmssg="Sie sind als Root angemeldet. Beantworten Sie die Fragen und melden Sie sich später mit dem gewählten Nutzernamen an!"

#standard messages
aktcmssg="Drücken se eine beliebige Taste um fortzufahren!"
bppmssg="Einen Augebnblick bitte ..."
thanksmssg="Vielen Dank!"

#website hinta

infomssg="More Info on https://github.com/horvan/drubuntu/wiki"

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
