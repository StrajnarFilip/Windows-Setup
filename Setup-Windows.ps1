# Install scoop
Start-Job -ScriptBlock { Invoke-RestMethod get.scoop.sh | Invoke-Expression } |  Wait-Job
# Wait
Start-Sleep -Seconds 15
# Install git
scoop install git
# Add extras bucket
scoop bucket add extras
# Add java bucket
scoop bucket add java
# Add games bucket
scoop bucket add games
# Install Brave browser
scoop install extras/brave
# Install VS Code
scoop install extras/vscode
# Install Python 3
scoop install python
# Install OpenJDK 17 LTS
scoop install java/openjdk17
# Install Netbeans IDE
scoop install extras/netbeans
# Install qbittorrent
scoop install extras/qbittorrent
# Install Powershell core
scoop install pwsh
# Install IntelliJ IDEA IDE
scoop install extras/idea
# Install Firefox
scoop install extras/firefox
# Install Android Studio IDE
scoop install extras/android-studio
# Install Syncthing
scoop install syncthing
# Install Node
scoop install nodejs-lts
# Install Maven
scoop install maven
# Install Gradle
scoop install gradle
# Install SBT
scoop install sbt
# Install GCC
scoop install gcc
# Install LLVM
scoop install llvm
# Install Leiningen
scoop install leiningen
# Install GHC
scoop install haskell
# Install Julia
scoop install julia
# Install Leiningen
scoop install leiningen
# Install .NET SDK
scoop install dotnet-sdk
# Install DBeaver
scoop install extras/dbeaver
# Install VLC media player
scoop install extras/vlc
# Install Zotero
scoop install extras/zotero
# Install Telegram
scoop install extras/telegram
# Install LibreOffice
scoop install extras/libreoffice
# Install Go
scoop install go
# Install Thunderbird
scoop install extras/thunderbird
# Install ShareX
scoop install extras/sharex
# Install 7zip
scoop install 7zip
# Install Elixir
scoop install elixir

function Add-RegistryCommand([string]$RegistryBase ,[string]$CommandName, [string]$Executable){
    New-Item -Path "Registry::${RegistryBase}" -Name $CommandName -Force
    New-Item -Path "Registry::${RegistryBase}\${CommandName}" -Name "command" -Value $Executable
}

### Functions to add right click option to background of a folder (blank space on right side of Windows Explorer)
### or in left side of Windows Explorer.

# For this computer (all accounts)
function Add-GlobalRightClickOptionFolderBackground([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CLASSES_ROOT\Directory\Background\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}

# Only for current account
function Add-UserRightClickOptionFolderBackground([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CURRENT_USER\Software\Classes\directory\Background\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}


### Functions to add right click option to a file. Note: you can use
### %1 symbol within Executable string to get selected file's path.

# For this computer (all accounts)
function Add-GlobalRightClickOptionFile([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CLASSES_ROOT\*\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}

# Only for current account
function Add-UserRightClickOptionFile([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CURRENT_USER\Software\Classes\*\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}

### Functions to add right click option to folder on the right side of Windows Explorer

# For this computer (all accounts)
function Add-GlobalRightClickOptionFolder([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CLASSES_ROOT\Directory\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}

# Only for current account
function Add-UserRightClickOptionFolder([string]$CommandName, [string]$Executable) {
    $RegistryBase = "HKEY_CURRENT_USER\Software\Classes\directory\shell"
    Add-RegistryCommand -RegistryBase $RegistryBase -CommandName $CommandName -Executable $Executable
}

Add-UserRightClickOptionFolderBackground -CommandName "Open with Visual Studio Code" -Executable "$((Get-Command -Name "code.cmd").Source) ."
Add-UserRightClickOptionFolderBackground -CommandName "Open with IntelliJ IDEA" -Executable "$((Get-Command -Name "idea.exe").Source) ."
Add-UserRightClickOptionFolderBackground -CommandName "Open in Powershell" -Executable "$((Get-Command -Name "pwsh.exe").Source) -WorkingDirectory ."

function DownloadFile([string]$FileUri, [string]$FileName) {
    Invoke-WebRequest -Uri $FileUri -OutFile "${FileName}.exe"
}

# Docker
$DockerUrl = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
DownloadFile -FileUri $DockerUrl -FileName "docker"

# Rust
$RustUrl = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe"
DownloadFile -FileUri $RustUrl -FileName "rustup-init"
