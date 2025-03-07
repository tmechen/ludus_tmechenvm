$installPath = "C:\Tools\EricZimmermann"
$zipUrl = "https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip"
$zipFile = "$installPath\ZimmermanTools.zip"
$installerScript = "$installPath\Get-ZimmermanTools.ps1"

if (!(Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
}

Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile
Expand-Archive -Path $zipFile -DestinationPath $installPath -Force
PowerShell -ExecutionPolicy Bypass -File $installerScript
$envPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
if ($envPath -notlike "*$net6Path*") {
    $newPath = "$envPath;$net6Path"
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
}
