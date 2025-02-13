###########################################################################
#
# This script will create a shared template in the CURRENT DATASOURCE 
#
###########################################################################
#-----------------------------------[Main]-------------------------------------
#check if RDM PS module is installed
if(-not (Get-Module RemoteDesktopManager -ListAvailable)){
	Install-Module RemoteDesktopManager -Scope CurrentUser
}

# Adapt the data source name
$ds = Get-RDMDataSource -Name "NameOfYourDataSourceHere"
Set-RDMCurrentDataSource $ds

$template = New-RDMTemplate -Name 'RDP Template' -Type 'RDPConfigured' -Destination 'Database' -SetTemplate
$template