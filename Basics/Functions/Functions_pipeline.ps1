function MultiplyByPipeline {
    [CmdletBinding()]
    param(
    # This parameter is the value object from the pipeline
    [Parameter(Mandatory=$true, ValueFromPipeline)]
    [int[]]$numbers
    )

    process{
        foreach($number in $numbers){
            Write-Output $number * $number
        }
    }
}

$inputs = @(1,2,3,4,5)

$inputs | MultiplyByPipeline | Write-Debug $_