bind 'set completion-ignore-case on'

shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
HISTCONTROL=ignoreboth
HISTSIZE=
HISTFILESIZE=

shopt -s checkwinsize # check the window size after each command and update LINES and COLUMNS

eval "$(oh-my-posh init bash --config ~/.config/bash/kali.omp.json)"
[ -f "$XDG_CONFIG_HOME/bash/.bash_aliases" ] && . "$XDG_CONFIG_HOME/bash/.bash_aliases"
[ -f "$XDG_CONFIG_HOME/bash/.dircolors" ] && eval "$(dircolors -b ~/.config/bash/.dircolors)"

# nodejs
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PATH="$HOME/.local/share/npm/bin:$PATH"

# rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
. "$XDG_DATA_HOME/cargo/env"

# asdf
# export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
# export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$XDG_CONFIG_HOME/asdf/tool-versions"
# [ -d "$XDG_DATA_HOME/asdf" ] && . "$XDG_DATA_HOME/asdf/asdf.sh"
# [ -d "$XDG_DATA_HOME/asdf" ] && . "$XDG_DATA_HOME/asdf/completions/asdf.bash"

# pyenv
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

