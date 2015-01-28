# Easy installing for Drubuntu
<p align="center">
<img src="http://drubuntu.github.io/drubuntu/images/logo-text.png" />
</p>

## With an ISO <a name="iso">
 
 <p align ="center">
 <a href="http://sourceforge.net/projects/drubuntu/files/latest/download"><img src="http://icons.iconarchive.com/icons/arrioch/senary-drive/512/Drive-Ubuntu-icon.png" alt="download Drubuntu" title="Download ISO" /></a>
</p> 

[![Download Drubuntu](https://sourceforge.net/sflogo.php?type=13&group_id=1804527)](https://sourceforge.net/projects/drubuntu)

[![Download Drubuntu](https://img.shields.io/sourceforge/dm/drubuntu.svg)](https://sourceforge.net/projects/drubuntu/files/latest/download) 

##Ubuntu has some bugs in it's debian installer for 14.04.01 currently so sometimes the installation will fail. 

If you having truble with installing the iso just:

1. Download the minimal CD
2. run the installer without selecting eny package
3. continue with the manual installation approach [(without git)](#without-git) after you are logged in!

___

## manual installation

###with git <a name="installation">
```Shell
git clone https://github.com/drubuntu/installation.git;
chmod +x installation/run.sh;
./installation/run.sh
```
###without git <a name="without-git">
```Shell
wget https://raw.githubusercontent.com/drubuntu/installation/master/run.sh
chmod +x run.sh;
./run.sh
```
---
installscripts for  [drubutu](https://github.com/drubuntu/drubuntu "Drubuntu") seperated for faster downloading.



