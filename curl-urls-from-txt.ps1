clear

# Delete the existing output file if it exists
$output_file = "curled.txt"
if (Test-Path $output_file) {
    Remove-Item $output_file
}

# Create banner$banner = @
" ___________________________________________________________
|                                                           |
|    Give me txt file with URLS and LET'S CURL THEM!        |
|                                                           |
|___________________________________________________________| 
"
# Output banner 
Write-Output $banner
# Prompt for text file with URLs
$file = Read-Host "Enter path to text file with URLs"

# Check if the file exists
if (-not (Test-Path $file_path)) {
Write-Host "The file doesn't exist."
exit
}
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
$curlOutput = curl $url
Add-Content $outputFile "URL: $url"
Add-Content $outputFile $curlOutput.Content
Add-Content $outputFile "___________________________________________________________________"
}
# Output path to output file
Write-Host "Done!"
Write-Host "Curl output saved to: $outputFile"
Write-Host "___________________________________________________________________"
# Show the contents of the output file
cat $output_file
