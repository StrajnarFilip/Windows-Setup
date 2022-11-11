# Placeholder for Chocolatey installation
[string]$Script = Invoke-RestMethod -Uri "https://"
[string[]]$Arguments = "-NoExit", "-Command", ${Script}
Start-Process -Verb runAs -FilePath powershell -ArgumentList $Arguments