# Uncomment lines with localhost on them:
$hostsPath = "$env:windir\System32\drivers\etc\hosts"
$hosts = get-content $hostsPath
$addEntry = $true
$hosts | %{
    if($_.contains('www.foo.com')){
        $addEntry = $false
        break
    }
}
Add-Content $hostsPath "#`tlocalhost`twww.foo.com"
notepad.exe $hostsPath