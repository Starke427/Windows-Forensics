# DFIR PowerShell Script - Collect Windows PCAP
# Author: Jeff Starke (Starke427)
# Updated: 2021May17

# Download and Unzip Tshark
$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Forensics/main/Tshark.zip"
$file1 = "C:\Tshark.zip"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
Expand-Archive -LiteralPath C:\Tshark.zip -DestinationPath C:\
Remove-Item -Path C:\Tshark.zip -Force

# Prompt for Tshark Interface
Get-NetIPConfiguration | Select InterfaceAlias,IPv4Address | Sort-Object -Property InterfaceAlias # Get Interface names and IPs
Start-Sleep 5
$interface = Read-Host -Prompt "Please enter the InterfaceAlias you would like to capture: "

# Run Tshark and Capture 50MB PCAP
$date = Get-Date -UFormat %Y%B%d_%H%M
& "C:\Tshark\tshark.exe" -i $interface -a filesize:50000 -w C:\capture_$date.pcap
Remove-Item -Path C:\Tshark -Recurse -Force
