 # Title: Script template for callable script
# ==========================================
# Author: yourname
# DateTime: createdDate

<# 

Description: used as a base template for my other scripts

#>

# Script parameters
# -----------------
param(
    
    [Parameter(Mandatory=$True,
    Position=1,
    HelpMessage='This is my parameter and it is compulsory'
    )]
    [string]$myparam

    )

# Functions
# ---------

# Add the PowerShell Snapin
$snapin = Get-PSSnapin | Where-Object {$_.Name -eq 'Microsoft.SharePoint.Powershell'}
if ($snapin -eq $null) 
{ 
    Add-PSSnapin "Microsoft.SharePoint.Powershell"
}

write-host Script started: (Get-Date -format t) -ForegroundColor Yellow

# Setup global objects
# --------------------

# Script
# ------

write-host Script finished: (Get-Date -format t) -ForegroundColor Yellow

 
