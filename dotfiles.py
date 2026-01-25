import sys
import platform
from pathlib import Path
import shutil

def copy(src: Path, dst: Path) -> None:
    if not src.exists():
        raise FileNotFoundError(f"No such file or directory: {src}")

    if not dst.exists():
        dst.parent.mkdir(parents=True, exist_ok=True)

    if src.is_file() != dst.is_file() or src.is_dir() != dst.is_dir():
        raise ValueError("Both file arguments must be the same type")

    if src.is_file():
        shutil.copy2(src, dst)
    else:
        shutil.copytree(src, dst, dirs_exist_ok=True)

    print(f"{src} -> {dst}")

def install(software: list[dict[str, Path]]):
    for i in software:
        copy(i["source"], i["target"])

def backup(software: list[dict[str, Path]]):
    for i in software:
        copy(i["target"], i["source"])

if __name__ == "__main__":
    software_macos = [
        {
            "source": "~/GitHub/dotfiles/ghostty/config",
            "target": "~/.config/ghostty/config"
        },
        {
            "source": "~/GitHub/dotfiles/git/",
            "target": "~/.config/git/"
        },
        {
            "source": "~/GitHub/dotfiles/karabiner/karabiner.json",
            "target": "~/.config/karabiner/karabiner.json"
        },
        {
            "source": "~/GitHub/dotfiles/npm/",
            "target": "~/.config/npm/"
        },
        {
            "source": "~/GitHub/dotfiles/nvim/",
            "target": "~/.config/nvim/"
        },
        {
            "source": "~/GitHub/dotfiles/vscode/keybindings.json",
            "target": "~/Library/Application Support/Code/User/keybindings.json"
        },
        {
            "source": "~/GitHub/dotfiles/vscode/settings.json",
            "target": "~/Library/Application Support/Code/User/settings.json"
        },
        {
            "source": "~/GitHub/dotfiles/zsh/.zprofile",
            "target": "~/.zprofile"
        },
        {
            "source": "~/GitHub/dotfiles/zsh/.zshenv",
            "target": "~/.zshenv"
        },
        {
            "source": "~/GitHub/dotfiles/zsh/.zshrc",
            "target": "~/.zshrc"
        },
        {
            "source": "~/GitHub/dotfiles/zsh/lss.lua",
            "target": "~/.config/zsh/lss.lua"
        }
    ]

    software_windows = [
        {
            "source": r"~\GitHub\dotfiles\csgo\autoexec.cfg",
            "target": r"C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\game\csgo\cfg\autoexec.cfg"
        },
        {
            "source": r"~\GitHub\dotfiles\tf2\autoexec.cfg",
            "target": r"C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\autoexec.cfg"
        }
    ]

    software = software_windows if platform.system() == "Windows" else software_macos

    software2 = []

    for i in software:
        j = {
            "source": Path(i["source"]).expanduser(),
            "target": Path(i["target"]).expanduser()
        }
        software2.append(j)

    if len(sys.argv) != 2:
        sys.exit(f"Usage: {sys.argv[0]} [install|backup]")

    argument = sys.argv[1].lower()

    if argument == "install":
        install(software2)
    elif argument == "backup":
        backup(software2)
