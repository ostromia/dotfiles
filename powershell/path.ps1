# function Sync-Path {
#     [CmdletBinding()]
#     param()

#     $seen = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
#     $paths = [System.Collections.Generic.List[string]]::new()

#     foreach ($source in @(
#         $env:Path
#         [Environment]::GetEnvironmentVariable('Path', 'Machine')
#         [Environment]::GetEnvironmentVariable('Path', 'User')
#     )) {
#         foreach ($entry in ($source -split ';')) {
#             $p = $entry.Trim().Trim('"').Trim()
#             if (-not $p) { continue }
#             if ($p -notmatch '^[A-Za-z]:\\$') { $p = $p.TrimEnd('\') }
#             if ($seen.Add($p)) { $paths.Add($p) }
#         }
#     }

#     $env:Path = $paths -join ';'
# }

function Sync-Path {
	$env:Path = @(
		$env:Path,
		[Environment]::GetEnvironmentVariable("Path", "User"),
		[Environment]::GetEnvironmentVariable("Path", "Machine")
	) -split ";" | ? { $_ } | % { $_.trimend("\") } | sort -unique | join-string ";"
}


