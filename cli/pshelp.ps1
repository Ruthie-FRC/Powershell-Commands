param(
[string]$query
)

$commands = Get-Content "../data/commands.json" | ConvertFrom-Json

$results = $commands | Where-Object {
$_.name -match $query -or $_.description -match $query
}

foreach ($cmd in $results) {

Write-Host ""
Write-Host "Command:" $cmd.name
Write-Host "Description:" $cmd.description
Write-Host "Example:" $cmd.examples[0]

}
