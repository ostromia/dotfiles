from pathlib import Path
import sys

folders = []
files = []

colors = {
    "blue": "\033[34m",
    "white": "\033[37m",
    "reset": "\033[0m"
}

if __name__ == "__main__":
    path = Path(sys.argv[1])
    folders = []
    files = []

    for i in path.iterdir():
        if i.is_dir():
            folders.append(i.name)
        else:
            files.append(i.name)

    folders.sort()
    files.sort()

    for i in folders:
        print(f"{colors['blue']}{i}{colors['reset']}")

    for i in files:
        print(f"{colors['white']}{i}{colors['reset']}")
