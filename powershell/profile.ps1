function Prompt {
    $cwd = (Get-Location).Path
    $osc7 = "`e]7;file:///$($cwd -replace '\\', '/')`a"
    Write-Host $osc7 -NoNewline
    $promptString = "${cwd}>"
    Write-Host $promptString -NoNewline -ForegroundColor Magenta
    return " "
}
