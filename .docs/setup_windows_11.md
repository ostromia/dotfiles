## Set up Windows 11
- personal notes on automating the installation and configuration of certain software on Windows 11

### 1 install PowerShell
```powershell
winget install -e --id Microsoft.Powershell
```

### 2 install and configure Git
```powershell
winget install -e --id Git.Git
git config --global user.email "66202981+berkay-yalin@users.noreply.github.com"
git config --global user.name "berkay-yalin"
winget install -e --id GitHub.cli
gh auth login
```

### 3.1 clone dotfiles repository
```powershell
mkdir ~/GitHub/
git clone https://github.com/berkay-yalin/dotfiles.git C:\Users\berka\GitHub\dotfiles
```

### 3.2 replace Windows Terminal with WezTerm
```powershell
winget install wez.wezterm
copy-item -path ~\GitHub\dotfiles\wezterm\.wezterm.lua -destination ~\.wezterm.lua
winget uninstall -e --id Microsoft.WindowsTerminal
```

### 3.3 install and configure Neovim
```powershell
winget install Neovim.Neovim
copy-item -path ~\GitHub\dotfiles\nvim -destination ~\AppData\Local\nvim -recurse
```

```powershell
# install vim-plug
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
# install plugins
nvim -c ":PlugInstall" -c ":qa"
```

```powershell
# install open-with-nvim.exe
$url = "https://api.github.com/repos/berkay-yalin/open-with-nvim/releases/latest"
Invoke-WebRequest -Uri ((Invoke-RestMethod -Uri $url).assets[0].browser_download_url) -OutFile ~\AppData\Local\nvim-data\open-with-nvim.exe
```

### 3.4 install and configure Visual Studio Code
```powershell
winget install -e --id Microsoft.VisualStudioCode
# open vscode for a second to create the Code folder in AppData
code; Start-Sleep -Seconds 1; Stop-Process -Name "Code"
copy-item ~\GitHub\dotfiles\vscode\settings.json ~\AppData\Roaming\Code\User\settings.json
copy-item ~\GitHub\dotfiles\vscode\keybindings.json ~\AppData\Roaming\Code\User\keybindings.json
```

### 3.5 install and configure JPEGView
```powershell
winget install -e --id sylikc.JPEGView
copy-item -path ~\GitHub\dotfiles\JPEGView\JPEGView.ini -destination ~\AppData\Roaming\JPEGView\JPEGView.ini
```
