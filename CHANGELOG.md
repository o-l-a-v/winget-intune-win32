# Changelog
## About
* Will only list major changes here.


## 221013
* Added the prerequired VCRedist / Microsoft Visual C++ 2015-2022 as a Win32 package, which all other Winget Win32 packages should have as a dependency.
  * Custom PowerShell script that downloads and installs latest version at runtime.
* Added more info to README.
* Added ```--source winget``` to install commands and detection scripts.
* Added uninstall commands using Winget.
* Fixed new winget package IDs for Microsoft ".NET Core Desktop Runtimes" and "VCRedist" in install commands and scripts, again.


## 220516
* Added:
  * Microsoft Edge WebView2 Runtime
* Changed dotnet runtimes after breaking change from Microsoft:
  * https://github.com/dotnet/core/issues/7428
* Renamed detection scripts using winget to have an underline before the ```UsingWinget``` part.


## 220506
* Added programs:
  * OBS Studio
* Added ```--exact``` to install commands and detection scripts for reliability and security.
  * In case packages are removed in future, and winget finds a package with similar id.


## 220328
* Added programs:
  * Microsoft .NET Core Desktop Runtime v5.0.0 and v6.0.0.
  * Microsoft SQL Server Management Studio (SSMS)
* Fixed Intune install status for "Upgrade - X" packages.
  * Detection scripts would return "Exit 0" in following two scenarios, but now returns "Exit 1" instead:
    * Winget-cli was not found, handled by common requirement script.
	* Path to installed software was not found, also handled by requirement rule.
  * Returning Exit 0 in the two mentioned scenarios made Intune report "Installed", even though it wasn't.
    * No impact other than wrong statistics from Intune.
* Added requirement script to check for pending reboots.
  * Stolen without asking from (Adam Bertram (adamtheautomator.com))[https://4sysops.com/archives/use-powershell-to-test-if-a-windows-server-is-pending-a-reboot/].
  * Adapted for use with Intune by me. But all creds goes to Adam.


## 220307
* Simplified common requirement script that checks minimum version of App Installer / Winget.exe.
* Added two custom user context apps:
  * 1Password
  * Zoom
* Added some user context winget apps:
  * Authy Desktop
  * Discord
  * Postman


## 220307
* Fixed breaking change when winget v1.2 renamed ```AppInstallerCLI.exe``` to ```winget.exe```.
  * Only affected apps from system context, which means most in this repo.
  * Detection logic will handle either file name.
  * Install logic will from now on only handle ```winget.exe```.
    * But added a requirement script for minimum version of ```App Installer``` where winget v1.2 was included.
	  * I'm thinkiong about making a Win32 package that installs newest version of ```App Installer``` if this requirement is not met.
