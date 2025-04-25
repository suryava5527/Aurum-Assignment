#Get Parameters
param (
    [string]$organization,
    [string]$project,
    [string]$repositoryName,
    [string]$accessToken
)

# Authorization Headers
$headers = @{
    "Authorization" = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$accessToken"))
    "Content-Type" = "application/json"
}

# Get Default Branch
Write-Host "Getting repository details..."
$repoUrl = "${organization}${project}/_apis/git/repositories/${repositoryName}?api-version=7.0"

Write-Host "Repo URL is : $repoUrl"

$repoData = Invoke-RestMethod -Uri $repoUrl -Headers $headers -Method Get
$defaultBranch = $repoData.defaultBranch.Replace("refs/heads/", "")  # Extract branch name

# Set as output variable for the pipeline
Write-Host "##vso[task.setvariable variable=defaultBranch;isOutput=true]$defaultBranch"
Write-Host "Default Branch: $defaultBranch"
