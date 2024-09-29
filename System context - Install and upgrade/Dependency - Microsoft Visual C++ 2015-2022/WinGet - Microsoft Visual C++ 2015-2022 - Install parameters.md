# WinGet - Microsoft Visual C++ 2015-2022 - Install parameters

## About

* WinGet package ID:
  * x64 / 64-bit: `Microsoft.VC++2015-2022Redist-x64`.
  * x86 / 32-bit: `Microsoft.VC++2015-2022Redist-x86`.
* The installer itself handles upgrading and removing old versions.

## App information

### Name

#### Install

* **x64**: Dependency - Install - Microsoft Visual C++ Runtime 2015-2022 x64
* **x86**: Dependency - Install - Microsoft Visual C++ Runtime 2015-2022 x86

#### Upgrade

* **x64**: Dependency - Upgrade - Microsoft Visual C++ Runtime 2015-2022 x64
* **x86**: Dependency - Upgrade - Microsoft Visual C++ Runtime 2015-2022 x86

### Description

Microsoft Visual C++ Runtime 2015-2022/v14.

### Publisher

Microsoft

### App version

Latest from WinGet

## Program

### Install command

#### x64 (both install and upgrade)

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.VC++2015-2022Redist-x64 --silent --source winget --accept-package-agreements --accept-source-agreements"
```

#### x86 (both install and upgrade)

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe install --exact --id Microsoft.VC++2015-2022Redist-x86 --silent --source winget --accept-package-agreements --accept-source-agreements"
```

### Uninstall command

#### x64

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.VC++2015-2022Redist-x64 --silent --source winget --accept-source-agreements"
```

#### x86

```bat
cmd /c "pushd "%ProgramW6432%\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe" && winget.exe uninstall --exact --id Microsoft.VC++2015-2022Redist-x86 --silent --source winget --accept-source-agreements"
```

## Behavior

System

## Requirements

### Both

#### General

* 64-bit
* \>= Windows 10 2004

#### Script - App Installer / WinGet minimum version

* **Script:** [Require-AppInstallerMinimumVersion.ps1](./../../Common/Require-AppInstallerMinimumVersion.ps1)
* **Output:** Boolean
* **Equals:** Yes

### Upgrade

#### x64

* **Path:** `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X64`
* **Name:** Version
* **Logic:** Exist
* **Redirect to x86:** Yes

#### x86

* **Path:** `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\X86`
* **Name:** Version
* **Logic:** Exist
* **Redirect to x86:** Yes

## Detection

### Install

#### x64

[Device_Detect-Install_MicrosoftVisualC++2015-2022x64_UsingWinget.ps1](./Device_Detect-Install_MicrosoftVisualC++2015-2022x64_UsingWinget.ps1)

#### x86

[Device_Detect-Install_MicrosoftVisualC++2015-2022x86Using_Winget.ps1](./Device_Detect-Install_MicrosoftVisualC++2015-2022x86_UsingWinget.ps1)

### Upgrade

#### x64

[Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x64UpgradeAvailable_UsingWinget.ps1](Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x64UpgradeAvailable_UsingWinget.ps1)

#### x86

[Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x86UpgradeAvailable_UsingWinget.ps1](./Device_Detect-Upgrade_MicrosoftVisualC++2015-2022x86UpgradeAvailable_UsingWinget.ps1)

## Dependencies

None

## Assignments

### Install

* None, use as dependencies for other Win32 apps.

### Upgrade

* All, remember requirement rule will make sure it only installs on
