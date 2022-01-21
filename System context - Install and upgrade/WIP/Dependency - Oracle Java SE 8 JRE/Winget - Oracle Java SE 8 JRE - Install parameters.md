# Winget - Oracle Java SE 8 JRE - Install parameters
## About
* Winget id: ```Oracle.JavaRuntimeEnvironment```.
* Must be licensed if used in enterprise.
  * https://www.oracle.com/java/java-se-subscription/


## App information
### Name
#### Install
Oracle Java SE 8 JRE
#### Upgrade
Upgrade - Oracle Java SE 8 JRE

### Description
Oracle Java SE (Standard Edition) 8 JRE (Java Runtime Environment).

### Publisher
Oracle

### App version
Latest from Winget


## Program
### Install command
#### Install and upgrade
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && AppInstallerCLI.exe install --id Oracle.JavaRuntimeEnvironment --override "/s INSTALLDIR=\"%ProgramW6432%\Oracle\Java SE 8 JRE\" AUTO_UPDATE=0 STATIC=0 REBOOT=0 REMOVEOUTOFDATEJRES=1 SPONSORS=0 WEB_JAVA=1" --accept-package-agreements --accept-source-agreements"

### Uninstall command
cmd /c "echo "Not added yet.""

### Behavior
System

### Exit codes
0 = Success


## Requirements
### All scenarios
* 64 bit
* \>= Windows 10 2004 20H1

### Upgrade
#### Manually -> File
Path:  %ProgramW6432%\Oracle\Java SE 8 JRE\bin  
File:  java.exe  
Logic: Exists.
#### Script
Script: Device_Require-OracleJavaSE8JREDoesNotRun.ps1  
Type:   Boolean  
Logic:  $true means not running, which is what we want.


## Detection
### Install
#### Manually -> File
Path:  %ProgramW6432%\Oracle\Java SE 8 JRE\bin
File:  java.exe
Logic: Exists.

### Upgrade
#### Script
Device_Detect-Upgrade_OracleJavaSE8JREUpgradeAvailableUsingWinget.ps1


## Dependencies
None.


## Assignment
### Install
* Available

### Upgrade
* Required


## Resources
### Winget-pkgs
* https://github.com/microsoft/winget-pkgs/blob/master/manifests/o/Oracle/JavaRuntimeEnvironment

### Oracle download
* https://www.oracle.com/java/technologies/javase/javase8u211-later-archive-downloads.html

### Oracle install parameters
* https://docs.oracle.com/javase/8/docs/technotes/guides/install/windows_installer_options.html
* https://docs.oracle.com/javase/8/docs/technotes/guides/install/config.html#table_config_file_options

### Oracle release notes
* https://www.oracle.com/java/technologies/javase/8u-relnotes.html
* https://www.java.com/releases/matrix/
