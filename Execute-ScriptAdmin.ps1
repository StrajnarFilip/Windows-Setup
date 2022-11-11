# Placeholder for Chocolatey installation
[string]$Script = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/StrajnarFilip/Windows-Setup/master/Setup-WindowsAdmin.ps1"
[string[]]$Arguments = "-NoExit", "-Command", ${Script}
Start-Process -Verb runAs -FilePath powershell -ArgumentList $Arguments