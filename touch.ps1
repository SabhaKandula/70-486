Param(
    [parameter(Mandatory = $true, Position = 0)]
    [String]
    $Filename,

    [Parameter()]
    [alias("d")]
    $Time = $DateTime.now(),

    [Parameter()]
    [switch]
    [alias("c")]
    $NoCreate
)

if (![System.IO.File]::Exists($Filename) -AND !$NoCreate) {
    $file = New-Item -ItemType "File" -Name $filename 
} else {
    $file = Get-Item -Path $Filename
}
$file.LastWriteTime = $Time