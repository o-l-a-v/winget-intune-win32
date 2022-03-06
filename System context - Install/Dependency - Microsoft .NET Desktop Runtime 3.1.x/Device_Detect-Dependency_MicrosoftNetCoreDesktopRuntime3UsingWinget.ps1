#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winge and PowerShell to detect whether installed, and if so to detect if newer version is available.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211120
        Modified: 220306

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Assets
## Scenario specific
$WingetPackageId = [string] 'Microsoft.dotnetRuntime.3-x64'

## Find winget-cli
### Find directory
$WingetDirectory = [string](
    $(
        if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
            (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1                
        }
        else {
            '{0}\Microsoft\WindowsApps' -f $env:LOCALAPPDATA
        }
    )
)
### Find file name
$WingetCliFileName = [string](
    $(
        [string[]](
            'AppInstallerCLI.exe',
            'winget.exe'
        )
    ).Where{
        [System.IO.File]::Exists(
            ('{0}\{1}' -f $WingetDirectory, $_)
        )
    } | Select-Object -First 1
)
### Combine and file name
$WingetCliPath = [string] '{0}\{1}' -f $WingetDirectory, $WingetCliFileName


# Check installed version and exit accordingly
$Installed = [bool](
    $(   
        [array](
            Get-ChildItem -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
        )
    ).Where{
        $_.GetValue('DisplayName') -like '*Desktop Runtime*' -and $_.GetValue('DisplayVersion') -like '3.1.*'
    }.'Count' -ge 1
)


# If not installed, exit 1
if (-not $Installed) {
    Write-Error -ErrorAction 'Continue' -Exception 'Not installed.' -Message 'Not installed.'
    Exit 1
}


# Check if newer version available
$WingetResult = [string[]](cmd /c ('"{0}" list --id {1} --accept-source-agreements'-f $WingetCliPath, $WingetPackageId))


# Check if update was available, exit 0 if not
if ($WingetResult[-3] -like '*available*') {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
