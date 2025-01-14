
Configuration CreateDSCPullServer
{
  Import-DSCResource -ModuleName xPSDesiredStateConfiguration

  Node dc1
  {

    # dsc service
    WindowsFeature DSCServiceFeature
    {
      Ensure = "Present"
      Name  = "DSC-Service"
    }

    # pull server web service
    xDscWebService PSDSCPullServer
    {
      Ensure                 = "Present"
      EndpointName           = "PSDSCPullServer"
      Port                   = 8080
      PhysicalPath           = "$env:SystemDrive\inetpub\wwwroot\PSDSCPullServer"
      CertificateThumbPrint  = "AllowUnencryptedTraffic"
      ModulePath             = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Modules"
      ConfigurationPath      = "$env:PROGRAMFILES\WindowsPowerShell\DscService\Configuration"
      State                  = "Started"
      DependsOn              = "[WindowsFeature]DSCServiceFeature"
      UseSecurityBestPractices = $false
      
    }

    # compliance server web service
    xDscWebService PSDSCComplianceServer
    {
      Ensure                 = "Present"
      EndpointName           = "PSDSCComplianceServer"
      Port                   = 9080
      PhysicalPath           = "$env:SystemDrive\inetpub\wwwroot\PSDSCComplianceServer"
      CertificateThumbPrint  = "AllowUnencryptedTraffic"
      State                  = "Started"
      DependsOn              = ("[WindowsFeature]DSCServiceFeature","[xDSCWebService]PSDSCPullServer")
      UseSecurityBestPractices = $false
    }

  }

}

CreateDSCPullServer
Start-DSCConfiguration -Path CreateDSCPullServer -Wait -Force
