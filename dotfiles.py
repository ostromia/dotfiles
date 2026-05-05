import json
import sys
import platform
from pathlib import Path
import shutil

def copy(
		src: Path,
		dst: Path,
		include: list[str] | None = None,
		exclude: list[str] | None = None,
	) -> None:
    if not src.exists():
        raise FileNotFoundError(f"No such file or directory: {src}")

    if not dst.exists():
        dst.parent.mkdir(parents=True, exist_ok=True)

    if (src.is_file() and dst.is_dir()) or (src.is_dir() and dst.is_file()):
        raise ValueError("Both file arguments must be the same type")

    if src.is_file():
        shutil.copy2(src, dst)
    else:
        if include is not None and exclude is not None:
            raise ValueError("Cannot specify both 'include' and 'exclude'")

        if include is not None:
            dst.mkdir(parents=True, exist_ok=True)
            for file in include:
                if (src / file).is_file():
                    shutil.copy2(src / file, dst / file)
                else:
                    shutil.copytree(src / file, dst / file, dirs_exist_ok=True)
        elif exclude is not None:
            dst.mkdir(parents=True, exist_ok=True)
            for file in src.iterdir():
                if file.name not in exclude:
                    if file.is_file():
                        shutil.copy2(file, dst / file.name)
                    else:
                        shutil.copytree(file, dst / file.name, dirs_exist_ok=True)
        else:
            shutil.copytree(src, dst, dirs_exist_ok=True)

    print(f"{src} -> {dst}")

def install(software: list[dict[str, Path | list[str]]]):
    for i in software:
        copy(
            i["source"],
            i["target"],
            include=i.get("include"),
            exclude=i.get("exclude"),
        )

    tweaks(software)

def backup(software: list[dict[str, Path | list[str]]]):
    for i in software:
        copy(
            i["target"],
            i["source"],
            include=i.get("include"),
            exclude=i.get("exclude"),
        )

def tweaks(software: list[dict[str, Path | list[str]]]):
    if platform.system() != "Windows":
        return

    vscode = next(
        d for d in software
        if d["source"].name == "vscode"
    )

    keybindings = vscode["target"] / "keybindings.json"
    content = keybindings.read_text(encoding="utf-8")
    content = content.replace("cmd+", "alt+")
    keybindings.write_text(content, encoding="utf-8")

def get_dotfile_paths():
    CWD = Path(__file__).resolve().parent

    with open(CWD / ".dotfiles" / "dotfiles.json") as f:
        dotfiles = json.load(f)

    dotfiles = dotfiles["windows" if platform.system() == "Windows" else "macos"]

    return [
        {
            **i,
            "source": Path(i["source"]).expanduser(),
            "target": Path(i["target"]).expanduser(),
        }

        for i in dotfiles
    ]

if __name__ == "__main__":
    dotfiles = get_dotfile_paths()

    if len(sys.argv) > 2:
        sys.exit(f"Usage: {sys.argv[0]} [install|backup]")

    argument = sys.argv[1].lower() if len(sys.argv) == 2 else "install"

    if argument == "install":
        install(dotfiles)

    elif argument == "backup":
        backup(dotfiles)

    else:
        sys.exit(f"Usage: {sys.argv[0]} [install|backup]")

