# Custom - Zoom - Install parameters

## About

* WinGet package ID: `Zoom.Zoom`.
* Why custom?
  * Want to install in user context so that it autoupdates.
    * Currently, WinGet package is system context MSI.
      * <https://github.com/microsoft/winget-pkgs/tree/master/manifests/z/Zoom/Zoom>

## App information

### Name

Zoom

### Description

Zoom

### Publisher

Zoom

### Version

Self-updating

## Program

### Install command

```bat
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\User_Install-Zoom.ps1'; exit $LASTEXITCODE"
```

### Uninstall command

```bat
cmd /c ""%APPDATA%\Zoom\uninstall\Installer.exe" /silent /uninstall"
```

### Behavior

User

## Requirements

* 64-bit
* \>= Windows 10 2004 20H1

## Detection

* **Path:** `%APPDATA%\Zoom\bin`
* **File:** `Zoom.exe`
* **Logic:** File or folder exists
* **PS:** `(Get-Item -Path ('{0}\Zoom\bin\Zoom.exe'-f$env:APPDATA)).VersionInfo.FileVersionRaw.ToString()`

## Resources

* Release notes
<https://support.zoom.us/hc/en-us/articles/201361953-Release-notes-for-Windows>
* Latest version
<https://zoom.us/client/latest/ZoomInstaller.exe>
