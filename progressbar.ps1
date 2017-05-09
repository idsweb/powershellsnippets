 for($i = 0 ; $i -lt $coll.Count; $i++){
    start-sleep 1
    [Int32]$p  = $i / $coll.Count * 100
    Write-Progress -Activity "Search in Progress" -Status "$p% Complete:" -PercentComplete $p 
} 
