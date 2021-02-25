# Windows-Forensics
Simplify generating forensic artifacts on Windows hosts by running this immutable script that will pull down Kansa and Autorunsc.

Output folder will be written to your C:\ directory and will include:

* Autorunsc
* DNSCache
* LocalAdmins
* LogUserAssist
* Netstat
* PrefetchListing
* ProcsWMI
* PSProfiles
* RdpConnectionLogs
* SmbSession
* SvcAll
* SvcFail
* SvcTrigs
* Tasklistv
* TempDirListing
* WMIEvtConsumer
* WMIEvtFilter
* WMIFltConBind
* And more, should you choose to modify the $ModuleConf variable in the script.


## Automated Forensics Collection

[run_kansa.ps1](https://raw.githubusercontent.com/Starke427/Windows-Forensics/main/run_kansa.ps1) will download, run and remove Kansa and Autoruns. It must be run from an Administrative PowerShell.

It is highly advised that you install Eric Zimmerman's [Timeline Explorer](https://f001.backblazeb2.com/file/EricZimmermanTools/TimelineExplorer.zip) for opening CSV's within Windows for easier viewing. Alternatively, you can import them into excel or view them directly within PowerShell using Import-Csv C:\Output.csv | Format-Table. Note: If downloading Timeline Explorer, DO NOT USE WINDOWS TO EXTRACT THINGS. Use 7-Zip or Winrar as Windows will block the DLLs!

You will be prompted for your current user's credentials when run. If you'd like to run this completely unattended, you can modify the script to run with hard-coded credentials by uncommenting $PWord, $AltCredential, and commenting $Credential.

```
$url1 = "https://raw.githubusercontent.com/Starke427/Windows-Forensics/main/run_kansa.ps1"
$file1 = "C:\run_kansa.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url1, $file1)
Set-ExecutionPolicy -ExecutionPolicy Bypass -force
& "C:\run_kansa.ps1"
```
