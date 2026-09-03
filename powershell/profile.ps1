function lss {
    python "$env:USERPROFILE/OneDrive/Documents/PowerShell/lss.py" $PWD
}

function gitdirty {
    python "$env:USERPROFILE/OneDrive/Documents/PowerShell/gitdirty.py" $PWD
}

function Prompt {
    $cwd = (Get-Location).Path
    $osc7 = "`e]7;file:///$($cwd -replace '\\', '/')`a"
    Write-Host $osc7 -NoNewline
    $promptString = "${cwd}>"
    Write-Host $promptString -NoNewline -ForegroundColor Magenta
    return " "
}

