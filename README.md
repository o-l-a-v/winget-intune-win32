# winget-intune-win32

> [!WARNING]
>
> * I haven't been working with Intune for years now, so I don't know  whether all this still works.
> * Feel free to open an issue or create a PR if you find any problems. 🙂
> * Files and info in this repo is provided as is. I'm not responsible for what you decide to push to your clients.
> * If logic in this repo breaks, I do not commit to fix it in a timely manner.
>

## About

### This repo

Repository containing examples of how to use WinGet from Intune, also in system context.

### Inspiration

After I saw that [rothgecw](https://github.com/rothgecw) had figured out how to use [`winget-cli` from System context](https://github.com/microsoft/winget-cli/discussions/962#discussioncomment-1561274), I started thinking about how this could be used from Intune.

## How to use

### Pre-requirements

Following requirements should be included in a fresh installation of Windows 10 and 11, but aren't always present. Which has caused problems. So I'm mentioning them here just in case.

* `winget-cli` must be installed, comes with newer versions of [App Installer](https://apps.microsoft.com/detail/9nblggh4nns1?hl=en-us&gl=US).
* [Microsoft Visual C++ Runtime v14 / 2015-2022](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist).
  * Might get error `0x8007007B` with text `The filename, directory name, or volume label syntax is incorrect (0x8007007B)` without it.
* Genuine, activated Windows 10 Education, Enterprise or Professional for using [Win32 with Intune](https://developer.microsoft.com/en-us/microsoft-365/dev-program).
  * Can be a typical problem if using Hyper-V VMs with [Microsoft 365 Developer Program](https://developer.microsoft.com/en-us/microsoft-365/dev-program) tenants.

### Setup per app

Create two Win32 packages per app you want to have in Intune installed with `winget-cli`.

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

* Uses a dummy `*.intunewin` containing nothing but an empty text file.

### Install

Usefull for all apps in `winget-pkgs` that is not in Microsoft Store.

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

* Use WinGet how you want, with whatever logic and mechanisms you want.

#### Other

* The postive far outweighs the negative, in my opinion.
  * See "Why not" section for context.
* "Free", with the pros and cons it brings.
  * Neither Windows or Intune is free.

### Why not

#### Network bandwidth

> [!TIP]
> There are tools that can download WinGet packages, package them to `.intunewin` and upload them to Intune, which could help offloading WAN using caching and peer to peer sharing. See [resources](#upload-winget-apps-to-intune-win32) for examples on such tools.

Running WinGet directly on the client does not support local caching or peer to peer, like uploading packages to Intune as Win32 apps does.

Apparently, WinGet supports Delivery Optimization, but only "HTTP Downloader".

* <https://learn.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization#windows-client>

Not "Peer to Peer" or "Microsoft Connected Cache (MCC)".

<details><summary>More references/ information</summary>

* WinGet CLI feature requests
  * <https://github.com/microsoft/winget-cli/issues/151>
  * <https://github.com/microsoft/winget-cli/issues/225>
* WinGet CLI settings
  * <https://learn.microsoft.com/en-us/windows/package-manager/winget/settings#downloader>
  * <https://github.com/microsoft/winget-cli/blob/master/doc/Settings.md#downloader>
* Delivery Optimization
  * <https://learn.microsoft.com/en-us/windows/deployment/do/whats-new-do>
* Microsoft Connected Cache (MCC)
  * <https://learn.microsoft.com/en-us/windows/deployment/do/waas-delivery-optimization>
  * <https://oliverkieselbach.com/2020/03/07/delivery-optimization-with-intune-and-microsoft-connected-cache-mcc/>
  * <https://www.petervanderwoude.nl/post/microsoft-connected-cache-in-configmgr-with-win32-apps-of-intune/>

</details>

#### Security and realibility

* WinGet default package manifest is public and open source.
  * Reliability - Without any guarantees or SLAs.
  * Security - So far without good controls for:
    * Authenticity
    * 2020-05-12: <https://github.com/microsoft/winget-pkgs/issues/100>
    * 2021-02-17: <https://github.com/microsoft/winget-pkgs/issues/7836>
    * 2022-11-18: <https://github.com/microsoft/winget-pkgs/issues/89190>
* Prerequirements like `winget-cli` itself, or Microsoft Visual C++ isn't always available on a clean OS install.
  * Means one must handle prerequirements before being able to use WinGet as part of an device enrollment processes.
* WinGet returns success if updating sources fails.
  * <https://github.com/microsoft/winget-cli/issues/2679>

#### Other shortcomings

##### winget-cli / winget.exe

`winget-cli` still has some shortcomings that other package managers handle better. Most noticably are apps that are added to `PATH`; Scoop handles this much better. Scoop also shines in its' abilities to extend functionality with PowerShell commands straight in the package manifest files, in my opninion. Not saying that Scoop is perfect, but that you might want multiple package managers in your tool belt.

One still have to make a considerable amount of custom logic to handle certain apps, but as WinGet has matured there are less breaking changes, like in the early days when `winget.exe` was named `AppInstallerCLI.exe` prior to WinGet v1.2.

Overview of progress:

* [What's on the roadmap?](https://github.com/microsoft/winget-cli/discussions/2063)
* [Milestones](https://github.com/microsoft/winget-cli/milestones)
* [Open issues sorted by amount of comments](https://github.com/microsoft/winget-cli/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc)

Some issues I've either experienced or I think is worth knowing about:

* Can't natively run WinGet from system context.
  * GitHub issue 2024-04-09: <https://github.com/microsoft/winget-cli/issues/4365>
  * GitHub issue for using the PowerShell module 2024-04-29: <https://github.com/microsoft/winget-cli/issues/4422>.
* Can't specify context (machine vs. user) with `upgrade`.
  * GitHub issue 2022-05-07: <https://github.com/microsoft/winget-cli/issues/2145>
* MSI doesn't always respect `--location`.
  * GitHub issue 2022-01-15: <https://github.com/microsoft/winget-cli/issues/1857>.
* Doesn't handle change in installer type, if vendor goes from EXE to MSI for instance.
  * GitHub issue 2021-10-25: <https://github.com/microsoft/winget-cli/issues/1640>.
* Can't create custom detection logic, or write custom `DisplayVersion` to registry, for installers that:
  * Does not write full version info to Windows registry.
    * Example: Microsoft VCRedist 2010: <https://github.com/microsoft/winget-cli/issues/2888>.
  * Does not update version number in registry on update:
    * Example: OBS Studio: <https://github.com/microsoft/winget-cli/issues/1856#issuecomment-1276870908>.
  * Writes a non-semver-compliant version number.
    * Example: MakeMKV: <https://github.com/microsoft/winget-cli/issues/1856>.
* Does not validate supported OS version, this offers non-compatible packages.
  * GitHub issue 2022-06-01: <https://github.com/microsoft/winget-cli/issues/2209>.
  * Example: Windows Terminal: <https://github.com/microsoft/winget-cli/issues/2134>.
* Packages one'd expect to be added to `PATH` is not.
  * GitHub issue 2020-08-24: <https://github.com/microsoft/winget-cli/issues/549>
* Portable packages that are added to `PATH` issue 1: Does not handle DLLs for symlinked executables.
  * GitHub issue 2022-11-19: <https://github.com/microsoft/winget-cli/issues/2711>.
* Portable packages that are added to `PATH` issue 2: Upgrade of user scope packages removes package from `PATH`.
  * GitHub issue 2024-01-08: <https://github.com/microsoft/winget-cli/issues/4044>.
* Portable packages does not get a start menu shortcut.
  * GitHub issue 2022-07-01: <https://github.com/microsoft/winget-cli/issues/2299>.

<details><summary>Issues that have been fixed</summary>

* No native PowerShell support.
  * <https://github.com/microsoft/winget-cli/issues/221>.
  * Solved with `Microsoft.WinGet.Client` PowerShell module.
* Can't easily configure apps to be excluded from `winget upgrade --all`.
  * <https://github.com/microsoft/winget-cli/issues/476>.
  * Solved with `winget pin`.
* Can't use installers inside ZIP files.
  * <https://github.com/microsoft/winget-cli/issues/140>.
  * <https://github.com/microsoft/winget-pkgs/issues/87300>.
  * Solved in WinGet v1.4.
* Can't use `winget upgrade` to upgrade a lot of apps, but can sometimes use `winget install` as a workaround.
  * GitHub issue: <https://github.com/microsoft/winget-cli/issues/752>.
  * Solved (mostly) in WinGet v1.3.
* Can't specify multiple IDs to install in one command.
  * GitHub issue: <https://github.com/microsoft/winget-cli/issues/219>.
  * Solved for `winget install` in WinGet v1.5.
* Can't specify installer type (MSI vs. EXE) if multiple are available with `install`, nor inside global settings.
  * <https://github.com/microsoft/winget-cli/issues/1166>.
  * <https://github.com/microsoft/winget-cli/issues/2146>.
  * Example: 7-Zip: <https://github.com/microsoft/winget-pkgs/blob/master/manifests/7/7zip/7zip/22.01/7zip.7zip.installer.yaml>
  * Solved in WinGet v1.6 with `winget install --installer-type`.

</details>

##### winget-pkgs / Manifest

* [Milestones](https://github.com/microsoft/winget-pkgs/milestones)
* [GitHub issues sorted by amount of comments](https://github.com/microsoft/winget-pkgs/issues?q=is%3Aissue+is%3Aopen+sort%3Acomments-desc)

## Resources

### Similar or relatable projects

* Install WinGet on servers: <https://github.com/asheroto/winget-install>
* <https://github.com/Romanitho/Winget-Install>
* <https://github.com/Romanitho/Winget-autoupdate>

### PowerShell modules

* Official module `Microsoft.WinGet.Client`: <https://www.powershellgallery.com/packages/Microsoft.WinGet.Client>
* Unofficial module `Cobalt` made using [Crescendo](https://learn.microsoft.com/en-us/powershell/utility-modules/crescendo/overview): <https://github.com/ethanbergstrom/Cobalt>
* Unofficial module `WingetTools`: <https://github.com/jdhitsolutions/WingetTools>

### Client GUIs

* <https://github.com/marticliment/UniGetUI>

### Upload WinGet apps to Intune Win32

* <https://github.com/FlorianSLZ/Intune-Win32-Deployer>
* <https://github.com/Romanitho/WingetIntunePackager>
* <https://github.com/svrooij/WingetIntune>, <https://wintuner.app/>

### Commercial products

* [Robopack](https://robopack.com/)
* [Patch My PC](https://patchmypc.com/application-patch-management)

### Tools

#### By Microsoft

* [winget-cli](https://github.com/microsoft/winget-cli)
* [winget-pkgs](https://github.com/microsoft/winget-pkgs)
* [Win32 Content Prep Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool)

#### By others

* [IconViewer](https://www.botproductions.com/iconview/download.html)
  * To extract icons from EXE files.
* [MsEndpointMgr - Intune Debug Toolkit](https://msendpointmgr.com/intune-debug-toolkit/)
* [Oliver Kieselbach](https://oliverkieselbach.com/) [IntuneWinAppUtilDecoder](https://github.com/okieselbach/Intune/tree/master/IntuneWinAppUtilDecoder)
* [Simeon Cloud](https://www.simeoncloud.com/) [IntuneAppBuilder](https://github.com/simeoncloud/IntuneAppBuilder)

### Requirements

* winget-cli
  * <https://www.microsoft.com/en-us/store/apps/9nblggh4nns1>
* winget-cli requirements
  * <https://github.com/microsoft/winget-cli#installing-the-client>
  * <https://github.com/microsoft/winget-cli/blob/master/doc/troubleshooting/README.md>
