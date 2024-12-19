## Set up MacOS

### homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### git

note: git should be installed through xcode

```bash
git config --global user.name "ostromia"

git config --global user.email "66202981+ostromia@users.noreply.github.com"

brew install gh

gh auth login
```

### dotfiles

```bash
mkdir GitHub

git clone https://github.com/ostromia/dotfiles.git "$HOME/GitHub/dotfiles"

# zsh
cp -f "$HOME/GitHub/dotfiles/zsh/.zshrc" "$HOME/.zshrc"

# git
cp -f "$HOME/GitHub/dotfiles/git/.gitconfig/" "$HOME/.gitconfig"

# vscode
cp -f "$HOME/GitHub/dotfiles/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"

cp -f "$HOME/GitHub/dotfiles/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

# nvim
rsync -av --delete "$HOME/GitHub/dotfiles/nvim" "$HOME/.config/"

# wezterm
cp -f "$HOME/GitHub/dotfiles/wezterm/.wezterm.lua" "$HOME/.wezterm.lua"
```
