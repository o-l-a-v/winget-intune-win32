# Winget - Snagit - Install parameters
## Notes
* Skipping using Winget for Snagit for now, because:
  * Package in ```winget-pkgs``` is not frequently updated, lagging behind.
  * Package in ```winget-pkgs``` is EXE installer with few install parameters.
    * We'd have to create additional logic, scripts, to add license key etc. 


## Resources
### Snagit
#### Download
* [MSI download](https://www.techsmith.com/enterprise-resources.html)
  * MSI and guide download.
#### Documentation
* [Snagit 2021 and later offline activation method](https://support.techsmith.com/hc/en-us/articles/360050288752)
* [Installing Snagit with MSI Installer](https://support.techsmith.com/hc/en-us/articles/203731128-Installing-Snagit-with-MSI-Installer)

### Winget
* [winget-pkgs - TechSmith.Snagit](https://github.com/microsoft/winget-pkgs/tree/master/manifests/t/TechSmith/Snagit)


22.0.1.15562

## Program
### Install command
winget install --id TechSmith.Snagit --override "TSC_APP_LANGUAGE=0 TSC_HIDE_REGISTRATION_KEY=1 TSC_SOFTWARE_KEY= TSC_START_AUTO=0"  --source winget --accept-package-agreements --accept-source-agreements
