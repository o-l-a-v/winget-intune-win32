#Requires -Version 5.1
<#
    .SYNOPSIS
        Checks if any Oracle Java SE 8 JRE x86 is installed.

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  220120
        Modified: 220120

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


# Detect
if (
    $(
        [array](
            Get-ChildItem -Path (
                'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\{0}Microsoft\Windows\CurrentVersion\Uninstall' -f (
                    $(
                        if ([System.Environment]::Is64BitOperatingSystem -and [System.Environment]::Is64BitProcess) {
                            'WOW6432Node\'
                        }
                    )
                )
            )
        )
    ).Where{
        $_.GetValue('DisplayName') -like 'Java 8*' -and
        $_.GetValue('InstallLocation') -like '*\jre*'
    }.'Count' -gt 0
) {
    Write-Output -InputObject 'Detected.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -ErrorRecord 'Not detected.' -Message 'Not detected.'
}
