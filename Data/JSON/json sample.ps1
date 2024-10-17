Get-Content -Path ".\Computer.json" | ConvertFrom-JSON
$JSON = Get-Content -Path ".\computer.json" | ConvertFrom-JSON
$JSON | Add-Member -Name "PSVersion" -MemberType NoteProperty -Value "7.0"
$JSON | ConvertTo-JSON | Out-File ".\computer2.json"
Get-Content -Path ".\Computer.json" -Raw | Test-JSON
