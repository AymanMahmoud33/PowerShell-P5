$response = Invoke-WebRequest -Uri https://fakerestapi.azurewebsites.net/api/v1/Activities -UseBasicParsing
$activity = $response | ConvertFrom-Json
foreach ($one in $activity)
{
    write-host "$($one.id) is: $($one.completed)"
}
