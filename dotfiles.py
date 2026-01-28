import sys
import platform
import json
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
    with open("dotfiles.json") as file:
        software = json.load(file)
        software = software["windows"] if platform.system() == "Windows" else software["macos"]

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
