#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether a new enough version of App Installer is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220306
        Modified: 220306

    .EXAMPLE
        # Run from this script header with F8 (Run Selection) from PowerShell ISE or VSCode
        & $(Try{$psEditor.GetEditorContext().CurrentFile.Path}Catch{$psISE.CurrentFile.FullPath}); $LASTEXITCODE
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$MinimumVersion = [System.Version] '1.17.10271.0'


# Detect and exit
if (
    $([System.Version]((Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller').'Version')) -ge $MinimumVersion
) {
    Write-Output -InputObject 'Installed.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -Exception 'Not installed.' -Message 'Not installed.'
    Exit 1
}
