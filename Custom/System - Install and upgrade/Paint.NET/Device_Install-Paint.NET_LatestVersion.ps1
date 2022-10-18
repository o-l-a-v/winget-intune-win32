#Requires -Version 5.1
#Requires -RunAsAdministrator
<#
    .SYNOPSIS
        Download and install the latest version of Paint.NET

    .NOTES
        Author:   Olav Rønnestad Birkeland | github.com/o-l-a-v
        Created:  211205
        Modified: 211206

    .EXAMPLE
        & $psISE.CurrentFile.FullPath; $LASTEXITCODE
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



# Help variable
$Success  = [bool] $true
$ExitCode = [int32] 0



# Wrap in Try/ Catch
Try {
    # Get latest version from GitHub
    ## Introduce step
    Write-Information -MessageData '# Get latest version info from GitHub'

    ## Get latest version from GitHub
    $Latest = [PSCustomObject](Invoke-RestMethod -Method 'Get' -Uri 'https://api.github.com/repos/paintdotnet/release/releases/latest')
    $LatestVersion  = [System.Version] $Latest.'name'
    $LatestFileUri  = [string] $Latest.'assets'.Where{$_.'name' -like '*.winmsi.x64.zip'}.'browser_download_url'
    $LatestFileSize = [uint32] $Latest.'assets'.Where{$_.'name' -like '*.winmsi.x64.zip'}.'size'

    ## Output info
    Write-Information -MessageData ('LatestVersion: {0}' -f $LatestVersion.ToString())
    Write-Information -MessageData ('LatestFileUri: {0}' -f $LatestFileUri)

    ## Failproof
    if ([string]::IsNullOrEmpty($LatestFileUri)) {
        Throw 'Failed to get URL to latest version MSI installer.'
    }



    # Download
    ## Introduce step
    Write-Information -MessageData ('{0}# Download' -f [System.Environment]::NewLine)

    ## Create download variables
    $DownloadPath = [string] '{0}\dl\{1}' -f $env:TEMP, $LatestFileUri.Split('/')[-1]
    $DownloadDir  = [string] [System.IO.Directory]::GetParent($DownloadPath)

    ## Output download target location
    Write-Information -MessageData ('Download to "{0}"' -f $DownloadPath)

    ## Prepare
    ### Create download target location directory if needed
    if (-not [System.IO.Directory]::Exists($DownloadDir)) {
        $null = [System.IO.Directory]::CreateDirectory($DownloadDir)
    }
    ### Delete download target location file if it already exists
    if ([System.IO.File]::Exists($DownloadPath)) {
        $null = [System.IO.File]::Delete($DownloadPath)
    }

    ## Download
    $null = [System.Net.WebClient]::new().DownloadFile(
        $LatestFileUri,
        $DownloadPath
    )

    ## Failproof
    ### Downloaded file does not exist
    if (-not [System.IO.File]::Exists($DownloadPath)) {
        Throw 'Failed to download - Did not find the expected file.'
    }
    ### Downloaded file size is not equal to what GitHub says it should be
    if ((Get-Item -Path $DownloadPath).'Length' -ne $LatestFileSize) {
        Throw 'Failed to download - Downloaded file does not match expected file size.'
    }



    # Unzip
    ## Introduce step
    Write-Information -MessageData ('{0}# Extract' -f [System.Environment]::NewLine)

    ## Create extract variables
    $ExtractPath = [string] $DownloadPath.Replace($DownloadPath.Split('.')[-1],'msi')

    ## Output extract path
    Write-Information -MessageData ('Extract to "{0}".' -f $ExtractPath)

    ## Delete file if it already exists
    if ([System.IO.File]::Exists($ExtractPath)) {
        $null = [System.IO.File]::Delete($ExtractPath)
    }

    ## Extract file
    $null = Expand-Archive -Path $DownloadPath -DestinationPath $DownloadDir

    ## Failproof
    ### Extracted file does not exist
    if (-not [System.IO.File]::Exists($ExtractPath)) {
        Throw 'Failed to extract - Did not find the extracted file.'
    }
    ### Extracted file is smaller than the ZIP file
    if ((Get-Item -Path $DownloadPath).'Length' -gt (Get-Item -Path $ExtractPath).'Length') {
        Throw 'Failed to extract - Extracted file is smaller than the ZIP.'
    }



    # Install
    ## Introduce step
    Write-Information -MessageData ('{0}# Install' -f [System.Environment]::NewLine)

    ## Install
    $null = cmd /c ('msiexec /i "{0}" /qn /norestart CHECKFORUPDATES=0 CHECKFORBETAS=0 DESKTOPSHORTCUT=0' -f $ExtractPath)

    ## Write information
    Write-Information -MessageData ('msiexec results: $? = "{0}", $LASTEXITCODE = "{1}".' -f $?.ToString(), $LASTEXITCODE.ToString())
}
Catch {
    # Set exit code
    if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) {
        $ExitCode = $LASTEXITCODE
    }
    # Set success to false
    $Success = [bool] $false
    # Write the catched error
    Write-Error -ErrorAction 'Continue' -ErrorRecord $_
}



# Clean up files
## Introduce step
Write-Information -MessageData ('{0}# Clean up files' -f [System.Environment]::NewLine)

## Clean up files
$([string[]]($DownloadPath,$ExtractPath)).Where{
    -not [string]::IsNullOrEmpty($_) -and [System.IO.File]::Exists($_)
}.ForEach{
    Write-Information -MessageData (
        'Deleting "{0}". Success? "{1}".' -f $_, $(
            Try {
                $null = [System.IO.File]::Delete($_)
                $?
            }
            Catch {
                $false
            }
        ).ToString()
    )
}



# Exit
## Introduce step
Write-Information -MessageData ('{0}# Exit' -f [System.Environment]::NewLine)

## Exit
if ($Success) {
    Write-Output -InputObject 'Done.'
    Exit 0
}
else {
    Exit $(if($LASTEXITCODE -and $LASTEXITCODE -ne 0){$LASTEXITCODE}else{1})
}
