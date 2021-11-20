# winget-intune-win32
## About
Repository containing examples of how to use winget from Intune, also in system context.

## Disclaimer
* Files and info in this repo is provided as is. I'm not responsible for what you decide to push to your clients.
* I'm not good at git. Feel free to commit changes, but I might struggle doing git right. Bear with me.

## Background
After I saw [rothgecw](https://github.com/rothgecw) had found of that [Winget-cli can run from System context](https://github.com/microsoft/winget-cli/discussions/962#discussioncomment-1561274), I started thinking about how that would be usefull from Intune.

## Basic idea
### What I want
Use Winget to create logic in Intune that will handle both install and upgrades.
* Set and forget, I don't want to maintain client applications in Intune.
* Control, I don't want to run ```winget upgrade --all``` because it also upgrades things like Office ProPlus.

### How it works
* Use a dummy *.intunewin containing nothing but a empty text file.
* Create two Win32 packages per app you want to have in Intune installed with Winget-cli.
  * One being available to install from Company Portal, where:
    * Install command uses winget-cli to get newest app available.
	* Detection rule is static, not checking version.
	  * If new version is detected in this package, Company Portal will say that app install failed.
	    * Maybe Company Portal can handle this in the future?
  * One being required, where:
    * Requirement rules requires app to be installed already.
	  * NB: If you don't want to interrupt the end user, make sure to add logic to requirement rule that does keep the upgrade from running if for instance process X and Y are running.
	* Detection rule uses winget-cli to detect if newer version is available.

### Remember
* Observe that I have different detection logic and assignment type, given these three different scenarios
  * Install
  * Upgrade
  * Dependency
