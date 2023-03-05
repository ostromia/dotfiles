# # don't do anything if not running interactively
# case $- in
#     *i*) ;;
#       *) return;;
# esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and update LINES and COLUMNS
shopt -s checkwinsize

# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     
#     alias ls='ls --color=auto'
#     alias dir='dir --color=auto'
#     alias vdir='vdir --color=auto'
#
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi

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

[ -f "$XDG_CONFIG_HOME/bash/.bash_aliases" ] && . "$XDG_CONFIG_HOME/bash/.bash_aliases"
[ -f "$XDG_CONFIG_HOME/bash/.dircolors" ] && eval "$(dircolors -b ~/.config/bash/.dircolors)"

eval "$(oh-my-posh init bash --config ~/.config/bash/kali.omp.json)"

# # export XDG_CONFIG_HOME="$HOME/.config"
# source "~/.config/bash/.bash_aliases"


# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'




# # set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#     debian_chroot=$(cat /etc/debian_chroot)
# fi
#
# # enable programmable completion features
# if ! shopt -oq posix; then
#   if [ -f /usr/share/bash-completion/bash_completion ]; then
#     . /usr/share/bash-completion/bash_completion
#   elif [ -f /etc/bash_completion ]; then
#     . /etc/bash_completion
#   fi
# fi
#
#
# shopt -s checkwinsize
#
# bind "set completion-ignore-case on"
#
# shopt -s histappend
# HISTCONTROL=ignoreboth
# HISTSIZE=-1
# HISTFILESIZE=-1
#
#
# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#
#
# [ -f "$HOME/.bash_aliases" ] && . "$HOME/.bash_aliases"
# [ -f "$HOME/.bash_dircolors" ] && eval "$(dircolors -b ~/.bash_dircolors)"
#
# export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"
#
# # rust
#
# # # node.js
# # export NVM_DIR="$XDG_DATA_HOME/nvm"
# # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# # export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
#
# # asdf
# export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
# export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
# export ASDF_DEFAULT_TOOL_VERSIONS_FILENAME="$XDG_CONFIG_HOME/asdf/tool-versions"
# . "$XDG_DATA_HOME/asdf/asdf.sh"
# . "$XDG_DATA_HOME/asdf/completions/asdf.bash"

