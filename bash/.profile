export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

