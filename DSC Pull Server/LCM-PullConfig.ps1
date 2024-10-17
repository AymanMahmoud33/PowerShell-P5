Configuration LCMPullConfig
{
    param
    (
        [string[]]$ComputerName,
        [string]$guid
    )

    Node $ComputerName
    {
        LocalConfigurationManager
        {
            ConfigurationMode = "ApplyAndAutoCorrect"
            ConfigurationID = $guid
            RefreshMode = "Pull"
            DownloadManagerName = "WebDownloadManager"
            DownloadManagerCustomData = 
                @{
                    ServerUrl = "http://dc1:8080/PSDSCPullServer.svc"
                    AllowUnsecureConnection = "true"
                }
        }
    }
}

LCMPullConfig -ComputerName Client1 -guid '8c521742-9042-463d-afcf-ebc27f6b2677' #this creates .MOF files for target machines
Set-DSCLocalConfigurationManager LCMPullConfig # this sends the configuration over to the target machines
Get-DscLocalConfigurationManager -CimSession Client1
