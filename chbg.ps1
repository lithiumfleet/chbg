# Define the path to the images directory
$imagesDirectory="D:\Powershell-BG"

# Get all image files from the directory (you can add more extensions if needed)
$imageFiles = Get-ChildItem $imagesDirectory | 
              Where-Object { $_.Name -match "\.jpg$|\.png$|\.JPG$|\.PNG$" } | 
              Select-Object -ExpandProperty FullName


# Check if any images were found
if ($imageFiles.Count -eq 0) {
    Write-Output "No image files found in the specified directory."
    exit
}

# Select a random image
$randomImage=Get-Random -InputObject $imageFiles

# Define the path to the Windows Terminal settings file
$settingsPath="$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Check if the settings file exists
if (Test-Path $settingsPath) {
    # Read the settings file content
    $settingsJson=Get-Content -Path $settingsPath -Raw | ConvertFrom-Json

    # Check if "profiles" and "defaults" are defined in the settings
    if ($settingsJson.profiles.defaults) {
        # Set the background image for the default profile
        $settingsJson.profiles.defaults.backgroundImage = $randomImage

        # Convert the JSON back to string and save it to the settings file
        $settingsJson | ConvertTo-Json -Depth 32 | Set-Content -Path $settingsPath

        Write-Output "Background image updated successfully."
    } else {
        Write-Output "The settings file does not contain the default profile settings."
    }
} else {
    Write-Output "Windows Terminal settings file not found."
}
