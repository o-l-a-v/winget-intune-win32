#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if a new version is available for Oracle Java SE 8 JRE.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220119
        Modified: 220119

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
$FileDetectPath  = [string] '{0}\Oracle\Java SE 8 JRE\bin\java.exe' -f $env:ProgramW6432
$WingetId        = [string] 'Oracle.JavaRuntimeEnvironment'

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
$WingetResult = [string[]](cmd /c ('"{0}" list --id {1}' -f $WingetCliPath, $WingetId))


# View output from Winget
Write-Information -MessageData ($WingetResult[-3 .. -1] -join [System.Environment]::NewLine)


# Check if update was available, exit 0 if not
if ($WingetResult[-3] -like '*available*') {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
