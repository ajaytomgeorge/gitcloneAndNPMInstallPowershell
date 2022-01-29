param (
    [Parameter(Mandatory=$true)]
    [string]$url = 'test'
)
function Invoke-GitClone($url) {
    Write-Host "$url "
    $name = $url.Split('/')[-1].Replace('.git', '')
    & git clone $url $name | Out-Null
    Set-Location $name
  }

  Invoke-GitClone($url)

  if (Test-Path __MACOSX){
    Get-ChildItem -Path .\__MACOSX * -File -Recurse | ForEach-Object { $_.Delete()}
    Remove-Item -Confirm:$false -r -Force "__MACOSX"
}
$count = (Get-ChildItem -Directory | Measure-Object).Count
if ( $count -eq 1 ){
    Write-Warning "Single folder found"
    Get-ChildItem -Directory | Set-Location
}
else
{
    Write-Warning "Multiple folders found"
}

Write-Warning "Attempting to install dependencies"
code .
yarn install
eslint src/**/*.js src/**/*.jsx 
yarn start

# powershell.exe -file cloner.ps1 -url 15