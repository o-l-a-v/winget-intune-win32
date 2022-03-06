# 220223 - winget-cli fails to update some packages - Testing with 1.3
## Resources
* https://github.com/microsoft/winget-cli/issues/752#issuecomment-1048293063
* https://github.com/microsoft/winget-cli/releases/tag/v1.3.431


## Test setup
* Hyper-V VM running Windows 10 21H2 with local user with admin permissions.
* Up to date as of 220223, and with Windows Package Manager 1.3.432-preview.


## Help
### Log location
%LOCALAPPDATA%\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\DiagOutputDir


## Tests
### Eraser.Eraser
#### Package
https://github.com/microsoft/winget-pkgs/tree/master/manifests/e/Eraser/Eraser
#### Commands
winget install --id Eraser.Eraser --version 6.2.2992 --silent --accept-package-agreements --accept-source-agreements
winget upgrade --id Eraser.Eraser --silent --accept-package-agreements --accept-source-agreements
#### Results
"A newer version was found, but the install technology is different from the current version installed. Please uninstall the package and install the newer version."
* https://github.com/microsoft/winget-cli/issues/752#issuecomment-1048897184

### Intel.IntelDriverAndSupportAssistant
#### Package
https://github.com/microsoft/winget-pkgs/tree/master/manifests/i/Intel
#### Results
Older versions not available anymore.

### Microsoft.PowerToys
#### Package
https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/PowerToys
#### Commands
winget install --id Microsoft.PowerToys --version 0.53.3 --silent --accept-package-agreements --accept-source-agreements
winget upgrade --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements
#### Results
Worked, leaves .NET 3.1.X when PowerToys v0.55.x installs .NET 5.X.X though.

### Microsoft.VC++2015-2022Redist-x64
#### Package
https://github.com/microsoft/winget-pkgs/tree/master/manifests/m/Microsoft/VC%2B%2B2015-2022Redist-x64
#### Commands
winget install --id Microsoft.VC++2015-2022Redist-x64 --version 14.31.31005.0 --silent --accept-package-agreements --accept-source-agreements
winget upgrade --id Microsoft.VC++2015-2022Redist-x64 --silent --accept-package-agreements --accept-source-agreements
#### Results
Worked.


### Oracle.JavaRuntimeEnvironment
#### Package
https://github.com/microsoft/winget-pkgs/tree/master/manifests/o/Oracle/JavaRuntimeEnvironment
#### Commands
winget install --id Oracle.JavaRuntimeEnvironment --version 8.0.3110.11 --silent --accept-package-agreements --accept-source-agreements
winget upgrade --id Oracle.JavaRuntimeEnvironment --silent --accept-package-agreements --accept-source-agreements
#### Results
Worked, but if ```winget list```, JRE is not listed as an application installed by Winget.
* https://github.com/microsoft/winget-cli/issues/752#issuecomment-1048918960
