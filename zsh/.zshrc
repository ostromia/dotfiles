PROMPT='%F{magenta}%~%f '

eval "$(/opt/homebrew/bin/brew shellenv)"

. "$HOME/.local/bin/env"

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

lss() {
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

    echo $folders

    files=$(printf "%s\n" "${files[@]}")
    files=$(echo $files | sort -f)

    echo $files
}
