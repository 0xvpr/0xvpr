#!/usr/bin/env powershell.exe

# check ssh availability
Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'

# Install SSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Start the SSH Server
Start-Service sshd
Get-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Set login shell to WSL2 bash
New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\WINDOWS\System32\bash.exe -c 'zsh -i'" -PropertyType String -Force
