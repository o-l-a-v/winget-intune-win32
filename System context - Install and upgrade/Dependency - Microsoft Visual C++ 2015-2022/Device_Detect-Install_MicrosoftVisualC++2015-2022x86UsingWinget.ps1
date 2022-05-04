#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if newest version of Microsoft Visual C++ 2015-2022 x86 is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220121
        Modified: 220504

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
#>



# Input parameters
[OutputType($null)]
Param()



# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'



# Fix winget encoding
$null = cmd /c '' # Workaround for PowerShell ISE "Exception setting "OutputEncoding": "The handle is invalid.""
$Global:OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()



# Assets
## Scenario specific
$WingetPackageId = [string] 'Microsoft.VC++2015-2022Redist-x86'


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


## Check Winget version
Write-Information -MessageData '# winget --version'
Write-Information -MessageData (cmd /c ('"{0}" --version' -f $WingetCliPath))


## Check if installed with Winget
### Winget list
$WingetListCommand = [string] '"{0}" list --id {1} --accept-source-agreements' -f $WingetCliPath, $WingetPackageId
$WingetList = [string[]](
    cmd /c $WingetListCommand | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetPackageId)
    }
)

### View
Write-Information -MessageData ('# {0}' -f $WingetListCommand)
Write-Information -MessageData ($WingetList -join [System.Environment]::NewLine)

### Exit if not installed
if ($WingetList.'Count' -le 0) {
    Write-Error -ErrorAction 'Continue' -Exception 'Not installed.' -Message 'Not installed.'
    Exit 1
}
else {
    Write-Information -MessageData 'Installed.'
}


## Check if upgrade available
### Winget upgrade
$WingetUpgrade = [string[]](
    cmd /c ('"{0}" upgrade' -f $WingetCliPath) | Where-Object -FilterScript {
        $_ -like ('*{0}*' -f $WingetPackageId)
    }
)

### View
Write-Information -MessageData ('# winget upgrade')
Write-Information -MessageData ($WingetUpgrade -join [System.Environment]::NewLine)

### Check if update was available, exit 0 if not
if ($WingetUpgrade.'Count' -gt 0) {
    Write-Error -ErrorAction 'Continue' -Exception 'Update available.' -Message 'Update available.'
    Exit 1
}
else {
    Write-Output -InputObject 'No update available.'
    Exit 0
}
