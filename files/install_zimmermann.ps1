$installPath = "C:\Tools\EricZimmermann"
$zipUrl = "https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip"
$zipFile = "$installPath\ZimmermanTools.zip"

if (!(Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
}

Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile
Expand-Archive -Path $zipFile -DestinationPath $installPath -Force
Remove-Item $zipFile -Force