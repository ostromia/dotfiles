# Set-Content -Path "C:\Program Files\PowerShell\7\profile.ps1" -Value ". C:\Users\berka\.config\powershell\profile.ps1"

Copy-Item -Path "$env:userprofile\.config\powershell\profile.ps1" -Destination "C:\Program Files\PowerShell\7\profile.ps1"  -Force

&"C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "$env:XDG_CONFIG_HOME\autohotkey\config.ahk"

