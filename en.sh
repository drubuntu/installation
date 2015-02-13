#!/bin/bash

# welcome messages
heightfin="-"
wcmssg1="Welcome to Drubuntu!"
wcmssg2="This assistant sets up Drubutu automatically." 
wcmssg3="These are just the basics. You can add more features later."

#messages acording to the file system
aptupdatemssg="updateing Ubuntu's repositories  ..."
dlbcmssg="Drubuntu is downloading base components, this may take some time ..."
createdirmsg="creating directories ..."
createfilesmsg="writing files ..."
plymoutlogomssg="Downloading boot logo ..."
vmtoolsmssg="Your Virtual machines drivers will be installed ..."
vmtoolsaimssg="These drivers are up to date, already!"
createsymlinksmssg="Creating Symlinks in your home directory ..."
grantprvsmssg="Grant privileges ..."
clngnmssg="Cleaning up!"
#LAMP
ap2setupmssg="Appache 2 is prepering for Drupal ..."
createmysqldbmssg="Creating MySql Database ..."

#Drupal
d7installmssg=" Installing Drupal 7  ..."
d8installmssg=" Installing Drupal 8  ..."
drushinstallmssg="Installing Drush ..."
createusermssg="Creating user account"
dseveninstallnc="The installation of Drupal 7 seems to be corrupted."
dwightinstallnc="The installation of Drupal 8 seems to be corrupted."
addftpd7mssg="Would you like to kreate the FTP user 'Drupal7'"

#user account
userdatamssg="Provide some details ,please"
enterusernamemmssg="Provide your desired user name and hit [ENTER]: "
disablerootmssg="closing down root accoound"
runasrootmssg="You need super user privileges to run this script. Use sudo, please!"
roothintmssg="You are logged in as Root. Answer the questions and log in with your desired user name!"

#standard messages
aktcmssg="Press any key to contineu!"
bppmssg="be patient, please ..."
notifymssg="You'll get a note as soon as we're done!"
thanksmssg="Thank You!"
yonmssg="Choose [y]es or [n]o, please!"
rebootmssg="Your system will be rebooted, instantly!"
infocorrectmssg="Are these informations correct? [y/N]" 
avonbmssg="Youtr new configuration is available after next reboot!" 

#website hints

infomssg="More Info on https://github.com/horvan/drubuntu/wiki"

#setip 

setipwcmssg="This script configures your network drivers to work with a Windows host."
usingvbmssg="If you are using VirtualBox we set everything up for you!"
defvbvlsmssg="Drubuntu uses defaults for VirtualBox."
enteripmssg="Enter an ip address for your server"
enternsmssg="Enter your network, please! (Same Acdress than windows network adapter in network control cneter)"
enternmmssg="Enter your netmask! (e.g. 255.255.255.0)"
enterbcmssg="enter your broadcast (The windows network adapter adress with 255 in it's last block)"
usingvbmssg="You are using VirtualBox"
ipsetaremssg="Your settings are:"
ifwentwrongipmssg="If something goes wrong visit "
newconfmssg="Your new settings are available after next reboot."
secondadaptermssg="don't forget to add an host only adapter."
ipeth0mssg="This is the adress of your first netwirk adapter:" 	 	
hitytoconfirmmmssg="Press [y] to finish the installation!" 	 	
dfsamssg="don't forget to add an host only adapter to youir VM!" 

#features
runhlpmssg="add  --help."
fetchfeaturesssg="fetching current list from server ..."

atombrandtext="A hackable text editor for the 21st Century"
apcswitch="--apc"
aptanaideswitch="--aptana"
aptanagitswitch="--aptana-git"
aptanaxdebugswitch="--aptanaxdebug"
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
apcmssg="Alternative cache for PHP."
aptanaidemssg="Aptana Studio 3."
aptanagitmssg="Advanced Git Support for Aptana Studio 3."
aptanaxdebugmssg=" Xdebug in Aptanastudio 3."
atommssg="GitHubs ATOM text editor."
bootstrapwsassmssg="Bootdstrap with Sass for Drupal7"
browsersmssg="Put's a suite of browsers to your systen."
desktopsmssg="Choose a graphical user interface for Ubuntu."
memcachedmssg="memcahced for Drupal 7."
plymouthmssg="recovers the boot splash."
proftpdmssg="ProFtp deamon to exchenge data with the host"
varnishmssg="Varnish Cache."
webexplangsmssg="Installiert Preprozessoren wie SASS und HAML."
xdebugmssg="XDebug for PHP."
shortapcmssg="APC"
shortaptanaidemssh="Aptana Studio 3"
shortaptanaxdebugmssg="XDebug for Aptana Studio 3"
shortatommssg="the Atom text editor powered by GitHub"
shortbootstrapwsassmssg="Bootstrap 3 with Sass for Dupal 7"
shortbrowsersmssg="some webbrowsers"
shortdesktopsmssg="the desktop chooser"
shortmemcachedmssg="MemCache"
shortplymouthmssg="the Bootlogo"
shortproftpdmssg="ProFtpd"
shoortvarnishmssg="Varnish"
shortwebexplangsmssg="some pre-processor-languages"
shortxdebugmssg="Xdebug"
needpassmssg="We need your password to install"
toyoursystemmssg="on your system."

apcisinstalledmssg="APC is installed, now!"
memcachedisinstalledmssg="Memcache is installed, now!"
takeyourtiemeaptanagitmssg="Seting up advanced gitsupport for Aptana Studio 3 takes just about half an hour "
javainstmssg="We need to install Java from Oracle. By installing Java you accept appendend licences."
aptanaxdbugmssg="Aptana Stdio is installing PDT and Xdebug. This may take a while..."
aptananextloginmssg="Aptana Studio is under your fingertips right after the next login!"
isinstallingnowmssg="is installing ...."
installgemmmsg="Sass Compass Haml and Less will be installd, now!"
installbdochanamssg="In addition to that we are installing bdoc und hana  for reference use."
installrubymssg="Ruby is installing ..."
installhamlmssg="HAML is installing ..."
installsassmssg="SASS is installing ..."
installcompassmssg="COMPASS is installing ..."
updaterubygemsmssg="updating Ruby Gems .."
bdochanainstallmssg="bdoc and hana are installing .."
#desktopchooser
prerequmssg="Required packages will be downloaded and installd ..."
lightdmmmsg="Lightdm is big, be patient,please!"
desktopchoosermssg="Desktopchooser"
choosedesktopmssg="Choose your desktop environment!"
xtoexitmssg="hit x to return to command line."
choosemssg="Coose from 1 - x"

#createsite 	 	
runsetipfirstmssg="Run dru-setip first" 	 	
entersitenamemssg="Enter your sites name, please. Without the ld ( dev, site, com ) and wothout Prefix ( www )!" 	 	
entertldmssg="enter your desiered tdl .dev, .com, .org without a dot ( . ), please!" 	 	
entersubmssg="Enter the sub domain name of yor projet (sub.domaain.tld), please!" 	 	
localvaluemssg="The given IP for localhost" 	 	
savaluemssg="The given ip address for the host only adapter" 	 	
isinvalidemssg="is not allowed." 	 	
siteassistmssg="With this assistent you can add a muktisite to Drupla" 	 	
wvtumssg="Witch version of drupal do you like to use?" 	 	
hostisactivemssg="Your new domoain is activated now" 	 	
invoptionmssg="unkown option" 	 	
 
#messages not used, yet
wvtumssg="Witch version of Drupal would you like to use?"
drupal7inputdatamssg="We need some crediterials for Drupal 7:"
enterd7domainmssg="Enter the domain for Drupal 7 and hit [RETURN]: "
enterd7dbusermssg="Enter your Database user name for Drupal 7 and hit [RETURN]: "
enterd7dbpassmssg="Enter the passsphrase for your Drupal 7 database and hit [RETURN]: "
drupal8inputdatamssg="We need some crediterials for Drupal 8:"
enterd8domainmssg="Enter the domain for Drupal 8 and hit [RETURN]: "
enterd8dbusermssg="Enter your Database user name for Drupal 8 and hit [RETURN]: "
enterd8dbpassmssg="Enter the passsphrase for your Drupal 8 database and hit [RETURN]: "
