Write-Warning "Setting Location D:\Hatchways\MyReviews"
Set-Location D:\Hatchways\MyReviews
Write-Warning "Moving D:\Hatchways\MyReviews to \previous"
$MyVariable =(get-date -f yyyy-MM-dd-HH-MM-ss)
New-Item -Path D:\Hatchways\MyReviews\$MyVariable -ItemType Directory
Set-Location D:\Hatchways\MyReviews\$MyVariable
# Rename-Item D:\Hatchways\MyReviews\previous\currentReview (get-date -f yyyy-MM-dd)
# Move-Item D:\Hatchways\MyReviews\currentReview D:\Hatchways\MyReviews\previous
#Remove-Item D:\Hatchways\MyReviews\currentReview -Force -Recurse
# Get-Childitem -Path  D:\Hatchways\MyReviews\currentReview -Recurse | Remove-Item
# New-Item -Path D:\Hatchways\MyReviews\currentReview -ItemType Directory
# Get-ChildItem -Path .\currentReview * -File -Recurse | ForEach-Object { $_.Delete()}
if(Test-Path -Path D:\Hatchways\MyReviews\*.zip -PathType Leaf)
{
Expand-Archive D:\Hatchways\MyReviews\*.zip -DestinationPath D:\Hatchways\MyReviews\$MyVariable
Write-Warning "Extraction complete"
Remove-Item D:\Hatchways\MyReviews\*.zip
Set-Location D:\Hatchways\MyReviews\$MyVariable
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
npm install
npm start
}
else {
    Write-Warning "No Zip file found"
    
}

