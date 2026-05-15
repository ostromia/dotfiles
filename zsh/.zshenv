# https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

export PYTHON_HISTORY=$XDG_STATE_HOME/python_history

export PATH="$HOME/.local/bin:$PATH"

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_AUTO_UPDATE=1

