# Functions can be declared simply as below
function Multiply ([int]$number1, [int]$number2) {
    return $number1 * $number2
}

# You can use more informative parameter syntax
function MultiplyMandatory {

    [CmdletBinding()]
    Param(
    [Parameter(Mandatory=$True,Position=1)]
    [int]$number1,

    [Parameter(Mandatory=$True, Position=2)]
    [int]$number2
    )

    return $number1 * $number2
}

# You can use more informative parameter syntax
function MultiplyOptional {
    
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory=$True,Position=1)]
    [int]$number1,

    [Parameter(Mandatory=$false, Position=2)]
    [int]$number2 = $number1
    )

    return $number1 * $number2
}

$result = Multiply '5' # returns 0 without error
Write-Debug $result

# $result = MultiplyMandatory '5' # will ask for input
# Write-Debug $result

$result = MultiplyMandatory '5' 3
Write-Debug $result

$result = MultiplyOptional '5' 3 # gives 15
Write-Debug $result

$result = MultiplyOptional '5' # gives 25
Write-Debug $result