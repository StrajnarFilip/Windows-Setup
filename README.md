# Windows-Setup
Powershell script

# Step 1: Allow yourself to execute Powershell scripts

```ps1
Start-Process -Verb runAs -FilePath powershell -ArgumentList "-Command","Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force"
```

# Step 2: Execute setup script
```ps1
Invoke-RestMethod "https://raw.githubusercontent.com/StrajnarFilip/Windows-Setup/master/Setup-Windows.ps1" | Invoke-Expression
```