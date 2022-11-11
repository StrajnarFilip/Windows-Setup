# Install scoop
Start-Job -ScriptBlock { Invoke-RestMethod get.scoop.sh | Invoke-Expression } |  Wait-Job
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

function DownloadFile([string]$FileUri, [string]$FileName) {
    Invoke-WebRequest -Uri $FileUri -OutFile "${FileName}.exe"
}

# Docker
$DockerUrl = "https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe"
DownloadFile -FileUri $DockerUrl -FileName "docker"

# Rust
$RustUrl = "https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe"
DownloadFile -FileUri $RustUrl -FileName "rustup-init"