$env:XDG_CONFIG_HOME = "$env:USERPROFILE/.config"
$env:XDG_CACHE_HOME  = "$env:USERPROFILE/.cache"
$env:XDG_DATA_HOME   = "$env:USERPROFILE/.local/share"
$env:XDG_STATE_HOME  = "$env:USERPROFILE/.local/state"

[System.Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "$env:USERPROFILE/.config", "User")
[System.Environment]::SetEnvironmentVariable("XDG_CACHE_HOME",  "$env:USERPROFILE/.cache",  "User")
[System.Environment]::SetEnvironmentVariable("XDG_DATA_HOME",   "$env:USERPROFILE/.local/share", "User")
[System.Environment]::SetEnvironmentVariable("XDG_STATE_HOME",  "$env:USERPROFILE/.local/state", "User")

[System.Environment]::SetEnvironmentVariable("NPM_CONFIG_USERCONFIG", "$env:USERPROFILE/.config/npm/npmrc", "User")

function lss {
    python "$env:USERPROFILE/OneDrive/Documents/PowerShell/lss.py" $PWD
}

function Prompt {
    $cwd = (Get-Location).Path
    $osc7 = "`e]7;file:///$($cwd -replace '\\', '/')`a"
    Write-Host $osc7 -NoNewline
    $promptString = "${cwd}>"
    Write-Host $promptString -NoNewline -ForegroundColor Magenta
    return " "
}

