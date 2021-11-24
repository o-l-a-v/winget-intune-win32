#Requires -Version 5.1
<#
    .SYNOPSIS
        Detects whether Notepad++ runs, returns $false if it does.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  211124
        Modified: 211124

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'


# Check if running
if (
    $(
        [array](
            Get-Process -Name 'xnconvert' -ErrorAction 'SilentlyContinue'
        )
    ).'Count' -le 0
) {
    Write-Information -MessageData 'Not currently running.'
    $true
}
else {
    Write-Information -MessageData 'Currently running.'
    $false
}
