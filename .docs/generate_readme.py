import os
import re

def set_section_title_and_description(file):
    file.write(
        """# dotfiles\n\ntrying to figure out how VimScript works\n\n"""
    )

def set_section_software(file):
    file.write(
"""## Software

| Software                                             | Source Code                                |
|------------------------------------------------------|--------------------------------------------|
| [a-Shell](https://holzschu.github.io/a-Shell_iOS/)   | https://github.com/holzschu/a-shell        |
| [AutoHotKey](https://autohotkey.com/)                | https://github.com/AutoHotkey/AutoHotkey   |
| [Bash](https://www.gnu.org/software/bash/)           | https://git.savannah.gnu.org/cgit/bash.git |
| [Git](https://git-scm.com/)                          | https://git.kernel.org/pub/scm/git/git.git |
| [Neovim](https://neovim.io/)                         | https://github.com/neovim/neovim           |
| [PowerShell](https://microsoft.com/PowerShell)       | https://github.com/PowerShell/PowerShell   |
| [tmux](https://tmux.github.io/)                      | https://github.com/tmux/tmux               |
| [Vifm](https://vifm.info/)                           | https://github.com/vifm/vifm               |
| [Visual Studio Code](https://code.visualstudio.com/) | https://github.com/microsoft/vscode        |
| [WezTerm](https://wezfurlong.org/wezterm/index.html) | https://github.com/wez/wezterm             |

"""
    )

def set_section_neovim_plugins(markdownFile, configFile):
    markdownFile.write("## Neovim Plugins\n\n")

    pattern = r"call plug#begin\(\)(.*?)call plug#end\(\)"
    vimplug = re.search(pattern, configFile.read(), re.DOTALL)
    vimplug = vimplug.group(1).strip()

    for i in vimplug.split("\n"):
        pattern = r"Plug '(.*?)'"
        match = re.match(pattern, i)

        if match:
            pluginName = match.group(1)
            pluginURL = "https://github.com/" + pluginName
            markdownFile.write(f"- [{pluginName}]({pluginURL})\n")

    markdownFile.write("\n")

def set_section_setup_windows_11(markdownFile):
    cwd = os.path.dirname(__file__)
    with open(cwd + r"\setup_windows_11.md") as file:
        markdownFile.write(file.read())

    markdownFile.write("\n")

if __name__ == "__main__":
    cwd = os.path.dirname(__file__)
    readmeMD = open( cwd + r"\..\README.md", "w+" )
    initVIM = open(  cwd + r"\..\nvim\init.vim"   )

    set_section_title_and_description(readmeMD)
    set_section_software(readmeMD)
    set_section_neovim_plugins(readmeMD, initVIM)
    set_section_setup_windows_11(readmeMD)

    readmeMD.close()
    initVIM.close()

