# Replace the TemplateName value with the name of the template that is displayed in the Navigation pane
$fldname = "\TemplateName"
$folders = Get-RDMSession -Name "TemplateName" | where {!($_.Group -like "*$fldname")}

foreach ($folder in $folders)
{
	$levels = $folder.Group.split('\')
	$name = $levels[$levels.count - 1]
	$folder.Name = $name
	Set-RDMSession $folder -Refresh
}

Update-RDMUI