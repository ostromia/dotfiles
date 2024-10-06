eval "$(/opt/homebrew/bin/brew shellenv)"

if [ "$TERM_PROGRAM = "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config ~/kali.omp.json)"
fi

