# PowerShell Pipelines

PowerShell pipelines pass objects between commands.

Example:

Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
