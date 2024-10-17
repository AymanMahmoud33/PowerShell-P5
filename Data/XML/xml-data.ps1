## casting the file text to an XML object
[xml]$xmlAttr = Get-Content -Path .\computers.xml

## looping through computers set with include="true"
$xmlAttr.Computers.Computer | Where-Object include -eq 'true' |  ForEach-Object {
    ## see if the current computer is online
    if(Test-Connection -ComputerName $_.ip -Count 1 -Quiet)
    {
        $status = 'Connection OK'
    }
    else
    {
        $status = 'No Connection'
    }

    ## output the result object
    [pscustomobject]@{
        Name = $_.name
        Ip = $_.ip
        Status = $status
    }
}
