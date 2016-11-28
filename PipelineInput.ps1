function Upper{
    param(  
    [Parameter(
        Position=0, 
        Mandatory=$true, 
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)
    ]
    [Alias('LowString')]
    [String[]]$lowStrings
    ) 

    process {
       foreach($string in $lowStrings)
       {
           return $string.ToString().ToUpper()
       }
    }
}


$words = @('how', 'low', 'can', 'you', 'go')

$words | upper