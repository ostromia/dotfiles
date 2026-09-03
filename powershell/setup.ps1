@{
    XDG_CONFIG_HOME = "$env:USERPROFILE/.config"
    XDG_CACHE_HOME  = "$env:USERPROFILE/.cache"
    XDG_DATA_HOME   = "$env:USERPROFILE/.local/share"
    XDG_STATE_HOME  = "$env:USERPROFILE/.local/state"

    NPM_CONFIG_USERCONFIG = "$env:USERPROFILE/.config/npm/npmrc"
}.GetEnumerator() | % { [System.Environment]::SetEnvironmentVariable($_.Key, $_.Value, "User") }
