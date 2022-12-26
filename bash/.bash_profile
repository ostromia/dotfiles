# if running bash include .bashrc if it exists
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# alias definition
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#configurations
w="/mnt/c/users/berka/OneDrive"

bind 'set completion-ignore-case on'

eval "$(oh-my-posh init bash --config ~/.config/nvim/fonts/kali.omp.json)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

