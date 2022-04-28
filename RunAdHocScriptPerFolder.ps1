function Write-Timestamp {
    Param([string]$Message)
    $d = Get-Date
    Write-Host "
$d $Message" -NoNewline
}

function Invoke-AdHocScript {
    Param ([string]$fullFolderPath)

    Write-Timestamp -Message "Now starting "
    Write-Host $fullFolderPath -ForegroundColor Magenta

    # Place your ad hoc script here that needs to run in each folder location.
    # It can be any commands that successfully execute from a PowerShell command prompt.
    # START AD HOC SCRIPT

    Set-Location $fullFolderPath 
    git status
    
    # END AD HOC SCRIPT
    
    Write-Output "
-------------------------------------------------------------------------------
    "
}

$startingFolder = Get-Location

# Execute the above script in each target folder
Invoke-AdHocScript -FullFolderPath "C:\path1"
Invoke-AdHocScript -FullFolderPath "C:\path2"
Invoke-AdHocScript -FullFolderPath "C:\path3"
Invoke-AdHocScript -FullFolderPath "C:\path4"

Set-Location $startingFolder