#Requires -Version 5.1
<#
    .SYNOPSIS
        Uses Winget and PowerShell to detect whether installed, and if so to detect if newer version is available.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220324
        Modified: 221013

    .EXAMPLE
        # Run from this script header with F8 (Run Selection) from PowerShell ISE or VSCode
        & $(Try{$psEditor.GetEditorContext().CurrentFile.Path}Catch{$psISE.CurrentFile.FullPath}); $LASTEXITCODE
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Assets
## Scenario specific
$WingetPackageId = [string] 'Microsoft.DotNet.DesktopRuntime.5'

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


# Check if $WingetCli exists
if (-not [System.IO.File]::Exists($WingetCliPath)) {
    Write-Output -InputObject 'Did not find Winget.'
    Exit 0
}


# Fix winget output encoding
$null = cmd /c '' # Workaround for PowerShell ISE "Exception setting "OutputEncoding": "The handle is invalid.""
$Global:OutputEncoding = [Console]::InputEncoding = [Console]::OutputEncoding = [System.Text.UTF8Encoding]::new()


# Check if update available with Winget
$WingetResult = [string[]](cmd /c ('"{0}" list --exact --id {1} --source winget --accept-source-agreements'-f $WingetCliPath, $WingetPackageId))


# View output from Winget
Write-Information -MessageData ($WingetResult[-3 .. -1] -join [System.Environment]::NewLine)


# Check if update was available, exit 0 if not
if ($WingetResult[-1] -like ('*{0}*' -f $WingetPackageId)) {
    if ($WingetResult[-3] -like '*available*') {
        Write-Error -ErrorAction 'Continue' -Exception 'Installed, but update available.' -Message 'Installed, but update available.'
        Exit 1
    }
    else {
        Write-Output -InputObject 'Installed and no update available.'
        Exit 0
    }
}
else {
    Write-Error -ErrorAction 'Continue' -Exception 'Not installed.' -Message 'Not installed.'
    Exit 1
}
