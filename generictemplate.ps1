 # Title: Script template for callable script
# ==========================================
# Author: yourname
# DateTime: createdDate
 <#

.SYNOPSIS
This is a simple Powershell script to explain how to create help

.DESCRIPTION
The script itself will only print 'Hello World'. But that's cool. It's main objective is to show off the cool help thingy anyway.

.EXAMPLE
./HelloWorld.ps1

.NOTES
Put some notes here.

.LINK
http://kevinpelgrims.wordpress.com

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
 if(-not $someObjectNeededOrCondition){
    Write-Host "Something bad happened - bailing out" -ForegroundColor Red
    write-host Script finished: (Get-Date -format t) -ForegroundColor Yellow
    break
} 
# Script
# ------

write-host Script finished: (Get-Date -format t) -ForegroundColor Yellow

 
