function Prompt {
    $promptString = "$(Get-Location)>"
    Write-Host $promptString -NoNewline -ForegroundColor Magenta
    return " "
}
