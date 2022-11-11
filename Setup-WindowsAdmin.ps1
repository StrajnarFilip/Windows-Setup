# Allows running all scripts
Start-Process -Verb runAs -FilePath powershell -ArgumentList "-Command","Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope LocalMachine -Force"

# Windows optional features
Disable-WindowsOptionalFeature -Online -NoRestart -FeatureName "WorkFolders-Client"
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName HypervisorPlatform
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName VirtualMachinePlatform
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName Microsoft-Hyper-V-Hypervisor 
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName Microsoft-Windows-Subsystem-Linux
Enable-WindowsOptionalFeature -Online -NoRestart -All -FeatureName Printing-PrintToPDFServices-Features