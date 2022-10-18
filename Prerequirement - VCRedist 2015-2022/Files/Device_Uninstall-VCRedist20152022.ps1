#Requires -RunAsAdministrator
#Requires -Version 5.1
<#
    .SYNOPSIS
        Uninstalls VCRedist v14 / 2015-2022

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  221013
        Modified: 221013

    .EXAMPLE
        & $psISE.CurrentFile.FullPath
#>



# Input parameters
[OutputType($null)]
Param()



# PowerShell preferences
$ErrorActionPreference = 'Stop'
$InformationPreference = 'Continue'
$ProgressPreference    = 'SilentlyContinue'



# Settings
if ([System.Net.ServicePointManager]::SecurityProtocol.ToString() -ne 'Tls12') {
    [System.Net.ServicePointManager]::SecurityProtocol = 'Tls12'
}



# Assets
$ScriptSuccess = [bool] $true
$Uri = [string](
    $(
        if ([System.Environment]::Is64BitOperatingSystem) {
            'https://aka.ms/vs/17/release/vc_redist.x64.exe'
        }
        else {
            'https://aka.ms/vs/17/release/vc_redist.x86.exe'
        }
    )
)
$Path = [string] '{0}\Temp\{1}' -f $env:windir, $Uri.Split('/')[-1]
$ArgumentList = [string[]](
    '/quiet',
    '/uninstall',
    '/full',
    '/norestart'
)



# Wrap in Try/ Catch for proper exit
Try {
    # Download
    Write-Output -InputObject 'Downloading'
    if ([System.IO.File]::Exists($Path)) {
        [System.IO.File]::Delete($Path)
    }
    $null = [System.Net.WebClient]::new().DownloadFile(
        $Uri,
        $Path
    )

    # Install
    Write-Output -InputObject 'Uninstalling'
    $Process = Start-Process -FilePath $Path -ArgumentList $ArgumentList -NoNewWindow -PassThru -Wait
    Write-Output -InputObject ('$? = "{0}", $Process.ExitCode = "{1}".' -f $?.ToString(), $(Try{$Process.'ExitCode'.ToString()}Catch{''}))
}
Catch {
    Write-Output -InputObject ('$LASTEXITCODE = "{0}", $Process.ExitCode = "{1}"' -f $LASTEXITCODE.ToString(), $(Try{$Process.'ExitCode'.ToString()}Catch{''}))
    $ScriptSuccess = [bool] $false
}



# Remove downloaded file if it exists
if ([System.IO.File]::Exists($Path)) {
    [System.IO.File]::Delete($Path)
}



# Exit
if ($ScriptSuccess) {
    Write-Output -InputObject 'Success.'
    Exit 0
}
else {
    Write-Error -ErrorAction 'Continue' -Exception 'Failed.' -Message 'Failed.'
    Exit 1
}
