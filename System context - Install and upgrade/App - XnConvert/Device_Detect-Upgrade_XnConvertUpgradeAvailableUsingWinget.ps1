#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if a new version is available for XnConvert.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211124
        Modified: 211124

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>


# Inpup parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Assets
## Scenario specific
$FileDetectPath  = [string] '{0}\XnConvert\xnconvert.exe' -f $env:ProgramW6432
$WingetId        = [string] 'XnSoft.XnConvert'

## Generic
$WingetCliPath = [string](
    $(
        if ([System.Security.Principal.WindowsIdentity]::GetCurrent().'User'.'Value' -eq 'S-1-5-18') {
            '{0}\AppInstallerCLI.exe' -f (
                (Get-Item -Path ('{0}\WindowsApps\Microsoft.DesktopAppInstaller_*_x64__8wekyb3d8bbwe' -f $env:ProgramW6432)).'FullName' | Select-Object -First 1                    
            )
        }
        else {
            '{0}\Microsoft\WindowsApps\winget.exe' -f $env:LOCALAPPDATA
        }
    )
)


# Check if installed, exit 0 if not
if (-not [System.IO.File]::Exists($FileDetectPath)) {
    Write-Output -InputObject 'Not installed, so no upgrade available.'
    Exit 0
}


# Check if $WingetCli exists
if (-not [System.IO.File]::Exists($WingetCliPath)) {
    Write-Output -InputObject 'Did not find Winget.'
    Exit 0
}


# Check if update available with Winget
$WingetResult = [string[]](cmd /c ('"{0}" list {1}' -f $WingetCliPath, $WingetId))


# Check if update was available, exit 0 if not
if ($WingetResult[-3] -like '*available*') {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
