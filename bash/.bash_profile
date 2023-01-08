XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

. ~/.config/bash/.bashrc
. ~/.config/bash/.bash_aliases

bind 'set completion-ignore-case on'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

eval "$(dircolors -b ~/.config/bash/.dircolors)"
eval "$(oh-my-posh init bash --config ~/.config/bash/kali.omp.json)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

