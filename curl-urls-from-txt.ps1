clear

# Create banner
$banner = 
"___________________________________________________________
|                                                           |
|    Give me txt file with URLS and LET'S CURL THEM!        |
|                                                           |
|___________________________________________________________| 
"
Write-Output $banner
# Prompt for text file with URLs
$file = Read-Host "Enter path to text file with URLs"
# Read URLs from file
$urls = Get-Content $file
# Create output file
$outputFile = "curled.txt"
if (Test-Path $outputFile) { Remove-Item $outputFile }
# Loop through each URL
foreach ($url in $urls) {
# Output URL being curled
Write-Host "Curling: $url"
# Send curl request and output response to file
$curlOutput = Invoke-WebRequest $url
Add-Content $outputFile ""
Add-Content $outputFile "URL: $url"
Add-Content $outputFile ""
Add-Content $outputFile ""
Add-Content $outputFile $curlOutput.Content
Add-Content $outputFile "___________________________________________________________________"
}
# Output path to output file
Write-Host "Done!"
Write-Host "Curl output saved to: $outputFile  <-------------------"
Write-Host "___________________________________________________________________"
# Show the contents of the output file
cat $output_file
