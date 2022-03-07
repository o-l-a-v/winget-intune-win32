# Changelog
## About
* Will only list major changes here.

## 220307
* Fixed breaking change when winget v1.2 renamed ```AppInstallerCLI.exe``` to ```winget.exe```.
  * Only affected apps from system context, which means most in this repo.
  * Detection logic will handle either file name.
  * Install logic will from now on only handle ```winget.exe```.
    * But added a requirement script for minimum version of ```App Installer``` where winget v1.2 was included.
	  * I'm thinkiong about making a Win32 package that installs newest version of ```App Installer``` if this requirement is not met.
