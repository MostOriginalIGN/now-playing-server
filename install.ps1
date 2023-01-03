# Copyright 2023 Astrogamer54. MIT license.
# Based off Denoland install script https://github.com/denoland/deno_install/svdir

param (
  # Specifies the version of the Minimalistic Desktop to install
  [string] $version
)

# Minimum required version of PowerShell
$PSMinVersion = 3

# Directory for Minimalistic Desktop files
${svdir} = "${HOME}\now-playing-server"

# If the $v parameter is provided, set the version to that value
if ($v) {
  $version = $v
}


# Prints a message to the console without a newline at the end
function Write-Part ([string] $Text) {
  Write-Host $Text -NoNewline
}

# Prints a message to the console in cyan text without a newline at the end
function Write-Emphasized ([string] $Text) {
  Write-Host $Text -NoNewLine -ForegroundColor "Cyan"
}

# Prints a green "OK" to the console
function Write-Done {
  Write-Host " > " -NoNewline
  Write-Host "OK" -ForegroundColor "Green"
}

# Prints a red "ERR" to the console
function Write-Err {
  Write-Host " > " -NoNewline
  Write-Host "ERR" -ForegroundColor "Red"
}

# Prints a yellow message to the console
function Write-Warn ([string] $Text) {
  Write-Host " > " -NoNewline
  Write-Host $Text -ForegroundColor "Yellow"
}

# Check if PowerShell version is greater than required version
if ($PSVersionTable.PSVersion.Major -gt $PSMinVersion) {
  # Stop script execution on error
  $ErrorActionPreference = "Stop"

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

  if (!(Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Error "Node.js is not installed. Please install Node.js and try again."
    break
  }

  if (-not $version) {
    $latest_release_uri =
    "https://api.github.com/repos/Astrogamer54/now-playing-server/releases"
    Write-Part "DOWNLOADING    "; Write-Emphasized $latest_release_urisp_dir
    $latest_release_json = Invoke-WebRequest -Uri $latest_release_uri -UseBasicParsing
    Write-Done

    $version = ($latest_release_json | ConvertFrom-Json)[0].tag_name -replace "v", ""
  }

  Write-Part "CREATING FOLDER     "; Write-Emphasized ${svdir}
  try {
    New-Item -Path ${svdir} -ItemType Directory
    Write-Done
  }
  catch [System.IO.IOException] {
    Write-Warn "Already Exists"
  } 
  $zip_file = "${svdir}\v${version}.zip"
  $download_uri = "https://github.com/Astrogamer54/now-playing-server/archive/refs/tags/v${version}.zip"
  Write-Part "DOWNLOADING    "; Write-Emphasized $download_uri
  Invoke-WebRequest -Uri $download_uri -UseBasicParsing -OutFile $zip_file
  Write-Done

  Write-Part "EXTRACTING     "; Write-Emphasized $zip_file
  Write-Part " into "; Write-Emphasized ${svdir};
  Expand-Archive -Path $zip_file -DestinationPath $svdir -Force
  Write-Done

  Write-Part "REMOVING       "; Write-Emphasized $zip_file
  Remove-Item -Path $zip_file
  Write-Done

  Set-Location "${svdir}\now-playing-server-${version}"
  
  Write-Part "INSTALLING       "; Write-Emphasized $zip_file
  npm i
  npm run installWindows
  Write-Done

  Write-Part "now-playing-server was installed successfully."; Write-Done
  Write-Part "To uninstall run node ${svdir}\now-playing-server-${version}\uninstWindows.js";
}
else {
  # Write message to console
  Write-Part "`nYour Powershell version is lesser than "; Write-Emphasized "$PSMinVersion";
  Write-Part "! Please update your PowerShell to at least version "; Write-Emphasized "$PSMinVersion"
  Write-Emphasized " to run this script.";
}



