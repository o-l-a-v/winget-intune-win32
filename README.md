# winget-intune-win32
## About
Repository containing examples of how to use winget from Intune, also in system context.

## Disclaimer
* Files and info in this repo is provided as is. I'm not responsible for what you decide to push to your clients.
* I'm not good at git. Feel free to commit changes, but I might struggle doing git right. Bear with me.
* If logic in this repo breaks, I do not commit to fix it in a timely manner.

## Background
After I saw [rothgecw](https://github.com/rothgecw) had found of that [Winget-cli can run from System context](https://github.com/microsoft/winget-cli/discussions/962#discussioncomment-1561274), I started thinking about how that would be usefull from Intune.

## Basic idea
### What I want
Use Winget to create logic in Intune that will handle both install and upgrades.
* Set and forget, I don't want to maintain client applications in Intune.
* Control, I don't want to run ```winget upgrade --all``` because it also upgrades things like Office ProPlus.

But only for apps that either does not autoupgrade by itself, or autoupgrade requires admin permissions.
* Excludes:
  * Apps in system context that auto updates using a service running as SYSTEM
    * Adobe Acrobat Reader DC
	* Google Chrome
	* Mozilla Firefox
  * Microsoft Store UWP apps
  * Apps in user context that auto updates
    * 1Password
	* Microsoft Visual Studio Code (User)
* Includes:
  * 7-Zip
  * Microsoft PowerToys
  * Microsoft Visual Studio Code
  * Notepad++

Apps not available in Microsoft Store that auto updates though, will still be nice to install using Winget. But then skip creating upgrade logic.

Piggyback others work.
* [winget-cli](https://github.com/microsoft/winget-cli)
* [winget-pkgs](https://github.com/microsoft/winget-pkgs)
* [Microsoft Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool)

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
