$dotnetUrl = "https://builds.dotnet.microsoft.com/dotnet/Runtime/6.0.36/dotnet-runtime-6.0.36-win-x64.exe"
$dotnetInstaller = "$env:TEMP\dotnet-runtime-installer.exe"

$installPath = "C:\Tools\EricZimmermann"
$zipUrl = "https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip"
$zipFile = "$installPath\ZimmermanTools.zip"
$installerScript = "$installPath\Get-ZimmermanTools.ps1"
$net6Path = "$installPath\net6"

Invoke-WebRequest -Uri $dotnetUrl -OutFile $dotnetInstaller
Start-Process -FilePath $dotnetInstaller -ArgumentList "/quiet /norestart" -Wait
Remove-Item -Path $dotnetInstaller -Force

if (!(Test-Path -Path $installPath)) {
    New-Item -ItemType Directory -Path $installPath -Force | Out-Null
}

Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile
Expand-Archive -Path $zipFile -DestinationPath $installPath -Force
Remove-Item $zipFile -Force

PowerShell -ExecutionPolicy Bypass -File $installerScript -Dest $installPath
$envPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
if ($envPath -notlike "*$net6Path*") {
    $newPath = "$envPath;$net6Path"
    [System.Environment]::SetEnvironmentVariable("Path", $newPath, [System.EnvironmentVariableTarget]::Machine)
}
Remove-Item $installerScript -Force
Remove-Item "$installPath\!!!RemoteFileDetails.csv" -Force