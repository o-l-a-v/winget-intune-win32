#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Uninstall any version of Paint.NET.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211205
        Modified: 211205

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
