#Get Parameters
param (
    [string]$organization,
    [string]$project,
    [string]$repositoryName,
    [string]$accessToken
)

# Use system access token provided by Azure DevOps
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$accessToken"))

$url = "${organization}${project}/_apis/git/repositories/${repositoryName}?api-version=7.0"
Write-Host "Fetching repo info from: $url"

$response = Invoke-RestMethod -Uri $url -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)}

$repoId = $response.id

# Set as output variable for the pipeline
Write-Host "##vso[task.setvariable variable=repoId;isOutput=true]$repoId"
Write-Host "Repository ID: $repoId"