# winget-intune-win32
## About
Repository containing examples of how to use winget from Intune, also in system context.



## Disclaimer
* Files and info in this repo is provided as is. I'm not responsible for what you decide to push to your clients.
* I'm not good at git. Feel free to commit changes, but I might struggle doing git right. Bear with me.
* If logic in this repo breaks, I do not commit to fix it in a timely manner.



## Background
After I saw that [rothgecw](https://github.com/rothgecw) had figured out how to use [```winget-cli``` from System context](https://github.com/microsoft/winget-cli/discussions/962#discussioncomment-1561274), I started thinking about how that would be usefull from Intune.



## Why
### Greenfield
* Configure once.


### Security
* Keep apps and dependencies up to date.
* Remove need for admin permissions for end users.

### End users ease of use
* Make everything and app that:
  * Does not require admin for install and update.
  * Can be installed from a central store, even though an app is not in Microsoft Store yet.
  * Autoupdates, even though it does not have such functionality built in, or if such functionality requires admin permissions.

### Flexibility
* Use Winget how you want, with whatever logic and mechanisms you want.

### Other
* The postive far outweighs the negative, in my opinion.
  * See "Why not" section for context.
* "Free", with the pros and cons it brings.
  * Neither Windows or Intune is free.



## Why not
### Bandwidth
* Does not utilize Delivery Optimization like packaging installers inside .intunewin does.


### Security
* Winget default package manifest is public and open source manifest, so far without good controls for:
  * Authenticity
    * https://github.com/microsoft/winget-pkgs/issues/7836


### Reliability
* Winget default package manifest is public and open source manifest, without any guarantees or SLAs.
  * But more and more automation and controls are added all the time.
* ```winget-cli``` is premature, a lot of what should be universal functionality does not work for everything yet.
  * Examples
    * Can't use ```winget upgrade``` to upgrade a lot of apps.
	* Can't easily configure apps to exclude from ```winget upgrade --all```.
  * Thus one must make a considerable amount of custom logic to handle certain apps, that might suddenly break when it gets fixed by the ```winget-cli``` project later.
* ```winget-pkgs``` manifest still has some considerable shortcomings.
* Prerequirements like ```winget-cli``` and Microsoft Visual C++ isn't alway available on a clean OS install.



## How it works
### General
* Uses a dummy ```*.intunewin``` containing nothing but an empty text file.


### Install
Usefull for all apps in ```winget-pkgs``` that is not in Microsoft Store.
* Get latest version whenever an app is installed the first time, without maintaining packages in Intune.


### Update
Only for apps without built-in auto update, or where auto-update requires admin permissions.
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



## How to use
### Pre-requirements
Following requirements should be included in a fresh installation of Windows 10 and 11, but aren't always present. Which has caused problems. So mentioning them here just in case.
* ```winget-cli``` must be installed, comes with newer versions of [App Installer](https://www.microsoft.com/en-us/store/apps/9nblggh4nns1).
* Microsoft Visual C++ Runtime v14 / 2015-2019.


### Setup per app
Create two Win32 packages per app you want to have in Intune installed with ```winget-cli```.
* One being available to install from Company Portal, where:
  * Install command uses winget-cli to get newest app available.
  * Detection rule is static, not checking version.
    * If new version is detected in this package, Company Portal will say that app install failed.
    * Maybe Company Portal can handle this in the future?
* One being required, where:
  * **Only required if the app itself does not have auto update functionality that doesn't require admin permissions.**
  * Requirement rules requires app to be installed already.
    * NB: If you don't want to interrupt the end user, make sure to add logic to requirement rule that does keep the upgrade from running if for instance process X and Y are running.
  * Detection rule uses winget-cli to detect if newer version is available.


### Remember
* Observe that I have different detection logic and assignment type, given these three different scenarios
  * Install
  * Upgrade
  * Dependency



## Future ideas
* Create single script per context (user, system) for upgrades.
  * PSADT, serviceui.exe and toast notifications for showing users notifications when logic runs from system context
    * https://www.anoopcnair.com/use-serviceui-with-intune-to-bring-system-process-to-interactive-mode/
  * Host manifest of what apps to upgrade in a storage account maybe?
    * Never use "winget upgrade --all".
	

	
## Resources
### Similar or related projects
* https://github.com/Romanitho/Winget-autoupdate
* https://github.com/jdhitsolutions/WingetTools


### Tools
#### By Microsoft
* [winget-cli](https://github.com/microsoft/winget-cli)
* [winget-pkgs](https://github.com/microsoft/winget-pkgs)
* [Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool)

#### By others
* [Oliver Kieselbach](https://oliverkieselbach.com/) [IntuneWinAppUtilDecoder](https://github.com/okieselbach/Intune/tree/master/IntuneWinAppUtilDecoder)


### Requirements
* Winget-cli
  * https://www.microsoft.com/en-us/store/apps/9nblggh4nns1
* Microsoft Visual C++ v14 / 2015-2019
  * https://aka.ms/vs/16/release/VC_redist.x64.exe
  * https://aka.ms/vs/16/release/VC_redist.x86.exe
