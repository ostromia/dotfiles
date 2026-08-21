function Sync-Path {
	$env:Path = @(
		$env:Path,
		[Environment]::GetEnvironmentVariable('Path', 'User'),
		[Environment]::GetEnvironmentVariable('Path', 'Machine')
	) -split ";" | ? {$_} | % { $_.trimend("\") } | sort -unique | join-string ";"
}

Sync-Path
