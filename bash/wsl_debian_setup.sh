#!bin/bash
if [ ! -d "$HOME/GitHub/dotfiles/" ]; then
    echo "cloning dotfiles repository"
    sudo apt install git
    mkdir -p GitHub/dotfiles/
    git clone https://github.com/berkay-yalin/dotfiles ~/GitHub/dotfiles
fi

# XDG Directories
mkdir -p ~/.config
mkdir -p ~/.cache
mkdir -p ~/.local/share
mkdir -p ~/.local/state

# oh my posh
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# git config
mkdir -p ~/.config/git/
cp -r ~/GitHub/dotfiles/git/ ~/.config/

# bash config
mkdir -p ~/.config/bash/
cp -r ~/GitHub/dotfiles/bash/ ~/.config/
cp ~/GitHub/dotfiles/bash/.bashrc ~/.bashrc
cp ~/GitHub/dotfiles/bash/.profile ~/.profile
source ~/.profile

# nvm
mkdir ~/.local/share/nvm/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install node

# tmux
sudo apt install tmux
cp -r ~/GitHub/dotfiles/tmux/ ~/.config/
source ~/.profile

