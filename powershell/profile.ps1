$env:XDG_CONFIG_HOME = "$env:userprofile\.config\"
$env:XDG_CACHE_HOME="$env:userprofile\.cache\"
$env:XDG_DATA_HOME="$env:userprofile\.local\share\"
$env:XDG_STATE_HOME="$env:userprofile\.local\state\"

function Prompt {
	$promptString = "$(Get-Location)>"
	Write-Host $promptString -NoNewline -ForegroundColor Magenta
	return " "
}

New-Alias "vifm" "$env:userprofile\.binary\vifm-w64-se-0.13-binary\vifm.exe"

