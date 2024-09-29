﻿#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Uninstall any version of Paint.NET.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  211205
        Modified: 211205

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
$AppDisplayName = [string] 'Paint.NET'



# Uninstall
$(
    [string[]](
        'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
        'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
    )
).ForEach{
    Get-ChildItem -Path $_
}.Where{
    $_.GetValue('DisplayName') -eq $AppDisplayName
}.ForEach{
    Write-Information -MessageData ('Uninstalling {0} v{1} GUID {2}' -f $AppDisplayName, $_.GetValue('Displayversion'), $_.'PSChildName')
    $null = cmd /c ('msiexec /x "{0}" /qn /norestart' -f $_.'PSChildName')
    Write-Information -MessageData ('msiexec results: $? = "{0}", $LASTEXITCODE = "{1}".' -f $?.ToString(), $LASTEXITCODE.ToString())
}



# Exit
Write-Output -InputObject 'Done.'
Exit 0
