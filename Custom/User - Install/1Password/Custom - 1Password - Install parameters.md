# WinGet - GitHub Desktop - Install parameters

## About

* WinGet package ID: `AgileBits.1Password`.
* Autou pdates in user context, so no need for update logic.
* CAUTION - Might not work if exploit protection / Windows Defender Exploit Guard is enabled.
  * <https://1password.community/discussion/123439>
* Why custom?
  * Currently many versions behind.
  * AgileBits have no plans of adding 1Password to Microsoft Store.
    * <https://1password.community/discussion/123440>
  * I asked AgileBits if they could maintain 1Password in winget-pkgs repo.
    * <https://1password.community/discussion/127956>

## App information

### Name

1Password

### Description

1Password

### Publisher

AgileBits

### App version

Latest from WinGet

## Program

### Install command

```bat
"%SystemRoot%\sysnative\WindowsPowerShell\v1.0\powershell.exe" -ExecutionPolicy "Bypass" -NoLogo -NonInteractive -NoProfile -WindowStyle "Hidden" -Command "& '.\User_Install-1Password.ps1'; exit $LASTEXITCODE"
```

### Uninstall command

```bat
cmd /c ""%LOCALAPPDATA%\1Password\app\8\1Password.exe" --uninstall --silent > nul"
```

### Behavior

User

## Requirements

* 64 bit
* \>= Windows 10 2004 20H1

## Detection

* **Path:** `%LOCALAPPDATA%\1Password\app\8`
* **File:** `1Password.exe`
* **Logic:** Exists

## Dependencies

None

## Assignment

Available

## Resources

### Changelog

* <https://op7.agilebits.com/windows-releasenotes>
* <https://app-updates.agilebits.com/product_history/OPW6>

### Community

* <https://1password.community/>

### Download

* <https://downloads.1password.com/win/1PasswordSetup-latest.exe>
