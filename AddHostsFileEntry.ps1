 # Simple script to add a host file entry
# ======================================

$hostsPath = "$env:windir\System32\drivers\etc\hosts"

$ip = '127.0.0.1'
$domain = 'yoursite.com'

Write-Host "Adding entry for $ip`t$domain"

$entryExists = $false

Write-Host "Current host file entries" -ForegroundColor Yellow

foreach ($line in [System.IO.File]::ReadLines($hostsPath)) {
    # do something with $line
    if($line.IndexOf('#') -lt 0){
        if($line.IndexOf($domain) -gt 0){
            $entryExists = $true
            Write-Host $line -ForegroundColor Red
        }
        else{
            Write-Host $line -ForegroundColor Yellow
        }
    }
}

if(-not $entryExists){
    Write-Host "Adding entry" -ForegroundColor Yellow
    Add-Content $hostsPath "$ip`t$domain"
    # notepad.exe $hostsPath
}
else{
    Write-Host "Entry exists already" -ForegroundColor Red
} 
