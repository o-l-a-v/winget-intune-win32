# winget-intune-win32
## About
### This repo
Repository containing examples of how to use winget from Intune, also in system context.

### Inspiration
After I saw that [rothgecw](https://github.com/rothgecw) had figured out how to use [```winget-cli``` from System context](https://github.com/microsoft/winget-cli/discussions/962#discussioncomment-1561274), I started thinking about how that would be usefull from Intune.


## Disclaimer
* Files and info in this repo is provided as is. I'm not responsible for what you decide to push to your clients.
* I'm not good at git. Feel free to commit changes, but I might struggle doing git right. Bear with me.
* If logic in this repo breaks, I do not commit to fix it in a timely manner.



## How to use
### Pre-requirements
Following requirements should be included in a fresh installation of Windows 10 and 11, but aren't always present. Which has caused problems. So I'm mentioning them here just in case.
* ```winget-cli``` must be installed, comes with newer versions of [App Installer](https://www.microsoft.com/en-us/store/apps/9nblggh4nns1).
* [Microsoft Visual C++ Runtime v14 / 2015-2022](https://docs.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist).
  * Might get error ```0x8007007B``` with text ```The filename, directory name, or volume label syntax is incorrect (0x8007007B)``` without it.
* Genuine, activated Windows 10 Education, Enterprise or Professional for using [Win32 with Intune](https://developer.microsoft.com/en-us/microsoft-365/dev-program).
  * Can be a typical problem if using Hyper-V VMs with [Microsoft 365 Developer Program](https://developer.microsoft.com/en-us/microsoft-365/dev-program) tenants.


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



## Future ideas
* Add check and fix for prerequirements, in case they aren't present.
  * App Installer version that includes ```winget-cli```.
  * Microsoft Visual C++ v14 runtime.
* Let users trigger updates themselves.
  * https://call4cloud.nl/2022/01/how-i-fell-in-love-with-app-updates/
* Create single script per context (user, system) for upgrades.
  * PSADT, serviceui.exe and toast notifications for showing users notifications when logic runs from system context
    * https://www.anoopcnair.com/use-serviceui-with-intune-to-bring-system-process-to-interactive-mode/
  * Host manifest of what apps to upgrade in a storage account maybe?
    * Never use "winget upgrade --all".



## Background
### Why
#### Greenfield
* Configure once.

#### Security
* Keep apps and dependencies up to date.
* Remove need for admin permissions for end users.

#### End users ease of use
Make everything and app that
* Does not require admin for install and update.
* Can be installed from a central store, even though an app is not in Microsoft Store yet.
* Autoupdates, even though it does not have such functionality built in, or if such functionality requires admin permissions.

#### Flexibility
* Use Winget how you want, with whatever logic and mechanisms you want.

#### Other
* The postive far outweighs the negative, in my opinion.
  * See "Why not" section for context.
* "Free", with the pros and cons it brings.
  * Neither Windows or Intune is free.


### Why not
#### Network bandwidth
Does not support local caching or peer to peer, like Intune Win32 apps does.

Apparently, Winget supports Delivery Optimization, but only "HTTP Downloader".

* https://docs.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization#windows-client

Not "Peer to Peer" or "Microsoft Connected Cache (MCC)".

<details><summary>More references/ information</summary>

* Winget-Cli feature requests
  * https://github.com/microsoft/winget-cli/issues/151
  * https://github.com/microsoft/winget-cli/issues/225
* Winget-Cli settings
  * https://docs.microsoft.com/en-us/windows/package-manager/winget/settings#downloader
  * https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md#downloader
* Delivery Optimization
  * https://docs.microsoft.com/en-us/windows/deployment/do/whats-new-do
* Microsoft Connected Cache (MCC)
  * https://docs.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization
  * https://oliverkieselbach.com/2020/03/07/delivery-optimization-with-intune-and-microsoft-connected-cache-mcc/
  * https://www.petervanderwoude.nl/post/microsoft-connected-cache-in-configmgr-with-win32-apps-of-intune/

</details>

#### Security and realibility
* Winget default package manifest is public and open source.
  * Reliability - Without any guarantees or SLAs.
  * Security - So far without good controls for:
    * Authenticity
     * https://github.com/microsoft/winget-pkgs/issues/100
     * https://github.com/microsoft/winget-pkgs/issues/7836
	 * https://github.com/microsoft/winget-pkgs/issues/89190
* Prerequirements like ```winget-cli``` itself, and Microsoft Visual C++ isn't always available on a clean OS install.
  * Means one must handle prerequirements before being able to use Winget as part of an device enrollment processes.

#### Other shortcomings
##### winget-cli / winget.exe
```winget-cli``` is premature, functionality that one would expect of a package manager isn't there yet.
* Thus one must make a considerable amount of custom logic to handle certain apps, that might suddenly break when it gets fixed by the ```winget-cli``` project later.
  * Concrete example: ```winget.exe``` was named ```AppInstallerCLI.exe``` prior to Winget v1.2.

Overview of progress:

* [What's on the roadmap?](https://github.com/microsoft/winget-cli/discussions/2063)
* [Milestones](https://github.com/microsoft/winget-cli/milestones)
* [Issues sorted by amount of comments](https://github.com/microsoft/winget-cli/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc)

Specific examples I've come across:

* No native PowerShell support.
  * https://github.com/microsoft/winget-cli/issues/221
* Can't use ```winget upgrade``` to upgrade a lot of apps.
  * But can often use ```winget install``` as a workaround.
* Can't easily configure apps to exclude from ```winget upgrade --all```.
  * https://github.com/microsoft/winget-cli/issues/476
* Can't specify multiple IDs to install in one command.
* Can't specify context (machine vs. user) with ```upgrade```.
  * https://github.com/microsoft/winget-cli/issues/2145
* Can't specify installer type (MSI vs. EXE) if multiple are available with ```install```, nor inside global settings.
  * https://github.com/microsoft/winget-cli/issues/2146
* MSI doesn't always respect ```--location```.
  * https://github.com/microsoft/winget-cli/issues/1857
* Can't use installers inside ZIP files.
  * https://github.com/microsoft/winget-cli/issues/140
* Doesn't handle change in installer type, if vendor goes from EXE to MSI for instance.
  * https://github.com/microsoft/winget-cli/issues/1640

##### winget-pkgs / Manifest
* [Milestones](https://github.com/microsoft/winget-pkgs/milestones)
* [Issues sorted by amount of comments](https://github.com/microsoft/winget-pkgs/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc)


	
## Resources
### Similar or related projects
* https://github.com/ethanbergstrom/Cobalt
* https://github.com/FlorianSLZ/Intune-Win32-Deployer
* https://github.com/jdhitsolutions/WingetTools
* https://github.com/martinet101/WingetUI
* https://github.com/Romanitho/Winget-Install
* https://github.com/Romanitho/Winget-autoupdate


### Tools
#### By Microsoft
* [winget-cli](https://github.com/microsoft/winget-cli)
* [winget-pkgs](https://github.com/microsoft/winget-pkgs)
* [Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool)

#### By others
* [Oliver Kieselbach](https://oliverkieselbach.com/) [IntuneWinAppUtilDecoder](https://github.com/okieselbach/Intune/tree/master/IntuneWinAppUtilDecoder)
* [Simeon Cloud](https://www.simeoncloud.com/) [IntuneAppBuilder](https://github.com/simeoncloud/IntuneAppBuilder)
* [IconViewer](https://www.botproductions.com/iconview/download.html)
  * To extract icons from EXE files.
* [MsEndpointMgr - Intune Debug Toolkit](https://msendpointmgr.com/intune-debug-toolkit/)


### Requirements
* winget-cli
  * https://www.microsoft.com/en-us/store/apps/9nblggh4nns1
* winget-cli requirements
  * https://github.com/microsoft/winget-cli#installing-the-client
  * https://github.com/microsoft/winget-cli/blob/master/doc/troubleshooting/README.md  
