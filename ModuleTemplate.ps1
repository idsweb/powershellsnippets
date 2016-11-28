function AddStuffMan{

    Param(
    [Parameter(Mandatory=$True)]
    [Int]$number1,
    [Parameter(Mandatory=$True)]
    [Int]
    $number2
    )
    Write-Host ($number1 + $number2)
}

function SquareStuffMan{

    Param(
    [Parameter(Mandatory=$True)]
    [Int]$number1
    )
    Write-Host ($number1 * $number1)
}

#In simple terms this function processes an array not an int
function SquareStuffManPipeLine{

    Param(
    [Parameter(Mandatory=$True, ValueFromPipeline=$true)]
    [Int[]]$numbers
    )

    process{
        foreach($num in $numberS)
        {
            Write-Host($num * $num)
        }
    }
}


$inputs = 1,2,3,4,5

$inputs | % { SquareStuffMan $_ } #this works OK


$inputs | SquareStuffManPipeLine