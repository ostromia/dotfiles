export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# . ~/.config/bash/.bashrc
# . ~/.config/bash/.bash_aliases

bind 'set completion-ignore-case on'

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# eval "$(dircolors -b ~/.config/bash/.dircolors)"
# eval "$(oh-my-posh init bash --config ~/.config/bash/kali.omp.json)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion




#
# export CARGO_HOME="$XDG_DATA_HOME"/cargo
# export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
#
# # export ASDF_CONFIG_FILE="${XDG_CONFIG_HOME}/asdf/asdfrc"
# # export ASDF_DATA_DIR="${XDG_DATA_HOME}/asdf"
#
#
# # # set PATH so it includes user's private bin if it exists
# # if [ -d "$HOME/bin" ] ; then
# #     PATH="$HOME/bin:$PATH"
# # fi
# # # set PATH so it includes user's private bin if it exists
# # if [ -d "$HOME/.local/bin" ] ; then
# #     PATH="$HOME/.local/bin:$PATH"
# # fi

