#!/bin/bash

# welcome messages
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
dseveninstallnc="Drupal 7 scheint nicht korrekt installiert zu sein."
dwightinstallnc="Drupal 8 scheint nicht korrekt installiert zu sein."
addftpd7mssg="Möchten Sie den FTP-Nutzer 'Drupal7' anlegen?"

#user account
userdatamssg="Wir benötigen nun einige Angaben von Ihnen"
enterusernamemmssg="Geben Sie Ihrenb gewünschten Nutzername an und dücken Sie [ENTER]: "
disablerootmssg="Root-Konto wird deaktiviert"
runasrootmssg="Zur Ausführung dieses Scripts werden Super-User-Rechte benötigt. Bitte verwenden Sie sudo!"
roothintmssg="Sie sind als Root angemeldet. Beantworten Sie die Fragen und melden Sie sich später mit dem gewählten Nutzernamen an!"

#standard messages
aktcmssg="Drücken se eine beliebige Taste um fortzufahren!"
bppmssg="Einen Augebnblick bitte ..."
notifymssg="Sie werden informiert, sobald der Vorgang abgeschlossen ist!"
thanksmssg="Vielen Dank!"
yonmssg="Bitte antworten Sie mit [j]a oder [n]ein! "
rebootmssg="Ihr System wird in Kürze neu gestartet!"

#website hints

infomssg="Weitere Informationen finden Sie unter: https://github.com/horvan/drubuntu/wiki"

#setip 

setipwcmssg="Dieses Script konfiguriert eine Statische Netzwerkasdresse für Windows."
usingvbmssg="Wenn Sie VirtualBox verwenden tragen wir die Werte automatisch ein!"
defvbvlsmssg="Es werden die von VirtualBox vergegebenen Standardwerte verwendet."
enteripmssg="Geben Sie die IP für Ihren Server ein"
enternsmssg="Geben Sie den netzwerkbereich ein! (Adresse Windows Netzwerkadapter)"
enternmmssg="Geben Sie Ihre Netzmaske ein! (z. B. 255.255.255.0)"
enterbcmssg="Geben Sie einen Brodcast ein (Adresse Windows Netzwerkadapter letzter Block 255)"
usingvbmssg="Sie verwenden VirtualBox"
ipsetaremssg="Ihre Einstellungen lauten;"
ifwentwrongipmssg="Sollte etwas schiefgehen besuchen Sie bitte "
newconfmssg="Die neuen Einstellungen sind nach den nächsten Neustrt verfügbar."
secondadaptermssg="Vergesen Sie nicht, einen Host-Only-Adapter hinzuzufügen."

#features

apcswitch="--apc"
aptanaideswitch="--aptana"
aptanagitswitch="--aptana-git"
aptanaxdebugswitch="--aptana-xdebug"
atomswitch="--atom"
bootstrapwithsassswitch="--bootstrap"
browserswitch="--broewsers"
desktopswitch="--desktops"
memcachedswitch="--memcache"
plymouthswitch="--plymouth"
proftpdswitch="--proftpd"
varnishshwitch="--varnish"
webexplangsswitch="--webexplangs"
xdebugswitch="--xdebug"
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
shortaptanaxdebugmssg="Xdebug für Aptana Studio 3"
shortatommssg="den Atom Texteditor von GitHub"
shortbootstrapwsassmssg="Bootstrap 3 mit Sass für Dupal 7"
shortbrowsersmssg="verschiedene Webbrowser"
shortdesktopsmssg="die Desktopauswahl"
shortmemcachedmssg="MemCache"
shortplymouthmssg="Das Bootlogo"
shortproftpdmssg="ProFtpd"
shoortvarnishmssg="Varnish"
shortwebexplangsmssg="devierse Preprozessoren"
shortxdebugmssg="Xdebug"
needpassmssg="Wir benötigen Ihr Passwort, um"
toyoursystemmssg="auf Ihrem System zu installieren"

apcisinstalledmssg="APC ist nun installiert!"
memcachedisinstalledmssg="MemCache ist nun installiert!"
takeyourtiemeaptanagitmssg="Die Installation zusätzliche Git-Unterstützung für Aptana Studio 3 benötigt ca. eine halbe Std. "
javainstmssg="Wir installieren Nun Java con Oracle. Sie akzeptiren hiermit die entsprendenden Lizenzbedingungen."
aptanaxdbugmssg="APtana Studio installiert nun PDT und XDebug. Die Installation dauert eine Weile."
aptananextloginmssg="Aptana Studio steht Ihnen ab dem nächsten Login zur verfügung!"
isinstallingnowmssg="wird nun installiert."
installgemmmsg="Sass Compass Haml und Less werden nun auf Ihrem System installliert!"
installbdochanamssg="Zsätzlich installieren wir bdoc und hana  damit Sie jederzeit nachschlagen können."
installrubymssg="Ruby wird nun installiert ..."
installhamlmssg="HAML wird nun installiert ..."
installsassmssg="SASS wird nun installiert ..."
installcompassmssg="COMPASS wird nun installiert ..."
updaterubygemsmssg="Die Ruby Gems werden nun aktuallisiert .."
bdochanainstallmssg="bdoc und hana werden nun installiert .."
#desktopchooser
prerequmssg="Installiere benötigte Pakete ..."
lightdmmmsg="Lightdm ist sehr groß, bitte haben Sie einen moment Gedult!"
desktopchoosermssg="Desktopauswahl für Drubuntu"
choosedesktopmssg="Wählen Sei Ihre gewünschte Arbeitsumgebung!"
xtoexitmssg="drückebn Sie x um zur Konsole zurückzukehren."
choosemssg="Treffen Sie ihre Wahl von 1 - x"
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
