# You can this dll from your Octopus Server/Tentacle installation directory or from
# https://www.nuget.org/packages/Octopus.Client/
Add-Type -Path 'Octopus.Client.dll' 

$apikey = 'API-xxx' # Get this from your profile
$octopusURI = 'http://localhost' # Your Octopus Server address

$endpoint = New-Object Octopus.Client.OctopusServerEndpoint $octopusURI,$apikey 
$repository = New-Object Octopus.Client.OctopusRepository $endpoint

$release = $repository.Releases.Get("Releases-1"); # Get this from /api/releases
$deployment = new-object Octopus.Client.Model.DeploymentResource
$deployment.ReleaseId = $release.Id
$deployment.ProjectId = $release.ProjectId
$deployment.EnvironmentId = "Environments-1" # Get this from /api/environments

$repository.Deployments.Create($deployment)
