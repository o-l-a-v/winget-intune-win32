# Todo

> [!NOTE]
> I do not commit to ever actually do these things.

## Standardization

* [ ] Standardize on requirement/dependency for packages installed using WinGet.
  * Use Win32 requirements to run some script?
    * [Common/Require-AppInstallerMinimumVersion.ps1](./Common/Require-AppInstallerMinimumVersion.ps1)

## Ideas

### Not done

* [ ] Let users trigger updates themselves.
  * <https://call4cloud.nl/2022/01/how-i-fell-in-love-with-app-updates/>.
* [ ] Create single script per context (user, system) for upgrades.
  * PSADT, serviceui.exe and toast notifications for showing users notifications when logic runs from system context
    * <https://www.anoopcnair.com/use-serviceui-with-intune-to-bring-system-process-to-interactive-mode/>
  * Host manifest of what apps to upgrade in a storage account maybe?
    * Never use "winget upgrade --all".

### Done

* [x] Add check and fix for prerequirements, in case they aren't present.
  * App Installer version that includes `winget-cli`.
  * Microsoft Visual C++ v14 runtime.
  * Done, see [here](./Prerequirement%20-%20VCRedist%202015-2022/Microsoft%20VCRedist%202015-2022%20-%20Install%20parameters.md).
