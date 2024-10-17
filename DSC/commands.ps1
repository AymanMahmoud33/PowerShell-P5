
# DSC cmdlets
Get-Command -Noun dsc*

#resources
Get-DscResource
Get-DscResource Service | Select -ExpandProperty properties
Get-DscResource File | Select -ExpandProperty properties

#applying a configuration
Start-DscConfiguration -Path LabConfig

#viewing deployed configurations
Get-DscConfiguration -CimSession DC2

#testing configurations (detect configuration drift!)
Test-DscConfiguration -CimSession DC2

#check LCM settings
Get-DscLocalConfigurationManager -CimSession DC2
Set-DscLocalConfigurationManager -Path LCMConfig
