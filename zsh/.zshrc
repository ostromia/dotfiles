PROMPT='%F{magenta}%~%f '

eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.local/bin/env"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs"

lss() {
    BLUE='\033[34m'
    NC='\033[0m'

    folders=()
    files=()

    for item in $(ls -A); do
        if [[ -d "$item" ]]; then
            folders+=("$item")
        elif [[ -f "$item" ]]; then
            files+=("$item")
        fi
    done

    folders=$(printf "%s\n" "${folders[@]}")
    folders=$(echo $folders | sort -f)

    if [[ -n "$folders" ]]; then
        printf "${BLUE}%s${NC}\n" "$folders"
    fi

    files=$(printf "%s\n" "${files[@]}")
    files=$(echo $files | sort -f)
    files=$(printf "%s\n" "${files[@]}" | awk -F. '{ if (NF > 1) ext=$NF; else ext=""; print ext "\t" $0 }' | sort -f | cut -f2-)

    if [[ -n "$files" ]]; then
        echo $files
    fi
}

