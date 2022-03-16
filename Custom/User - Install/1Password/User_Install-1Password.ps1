#Requires -Version 5.1
<#
    .SYNOPSIS
        Installs 1Password in user context.

    .NOTES
        Author:   Olav Rønnestad Birkeland
        Created:  220316
        Modified: 220316

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>


# Input parameters
[OutputType($null)]
Param()


# PowerShell preferences
$ErrorActionPreference = 'Stop'


# Assets
$Uri = [string] 'https://downloads.1password.com/win/1PasswordSetup-latest.exe'
$Arguments = [string[]]('--silent')
$DownloadPath = [string] '{0}\{1}' -f $env:TEMP, $Uri.Split('/')[-1]
$DetectionPath = [string] '{0}\1Password\app\8\1Password.exe' -f $env:LOCALAPPDATA


# Check if installed already
if ([System.IO.File]::Exists($DetectionPath)) {
    Write-Output -InputObject 'Already installed.'
    Exit 0
}


# Download
Write-Output -InputObject '# Download'
if ([System.IO.File]::Exists($DownloadPath)) {
    $null = [System.IO.File]::Delete($DownloadPath)
}
$null = [System.Net.WebClient]::new().DownloadFile(
    $Uri,
    $DownloadPath
)
Write-Output -InputObject ('$? = "{0}", $LASTEXITCODE = "{1}".' -f $?.ToString(), $LASTEXITCODE)


# Install
Write-Output -InputObject '# Install'
$Process = Start-Process -FilePath $DownloadPath -ArgumentList $Arguments -Wait -PassThru
Write-Output -InputObject (
    '$? = "{0}", $LASTEXITCODE = "{1}", $Process.ExitCode = "{2}".' -f (
        $?.ToString(),
        $LASTEXITCODE,
        $Process.'ExitCode'
    )
)


# Exit
Write-Output -InputObject '# Exit'
if ([System.IO.File]::Exists($DetectionPath)) {
    Write-Output -InputObject 'Done.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -Exception 'Failed.' -Message 'Failed.'
    Exit 1
}
