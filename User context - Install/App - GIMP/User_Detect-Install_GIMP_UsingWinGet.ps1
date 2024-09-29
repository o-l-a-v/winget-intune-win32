#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget to see if newest version of GIMP is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  2024-09-29
        Modified: 2024-09-29

    .EXAMPLE
        # Run from this script header with F8 (Run Selection) from PowerShell ISE or VSCode
        & $(Try{$psEditor.GetEditorContext().CurrentFile.Path}Catch{$psISE.CurrentFile.FullPath}); $LASTEXITCODE
#>



# Input parameters
[OutputType([System.Void])]
Param()



# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'



# Fix winget output encoding
$null = cmd /c '' # Workaround for PowerShell ISE "Exception setting "OutputEncoding": "The handle is invalid.""
$Global:OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()



# Assets
## Scenario specific
$WingetPackageId = [string] 'GIMP.GIMP'


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


## Check installed version
Write-Information -MessageData '# winget --version'
Write-Information -MessageData (cmd /c ('"{0}" --version' -f $WingetCliPath))


## Check if installed with Winget
### Winget list
$WingetListCommand = [string] '"{0}" list --exact --id {1} --scope user --source winget --accept-source-agreements' -f $WingetCliPath, $WingetPackageId
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
