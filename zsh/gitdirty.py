import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

COLORS = {
    "yellow": "\033[33m",
    "reset": "\033[0m"
}

def isdirty(folder: Path) -> bool:
    result = subprocess.run(
        ["git", "status", "--porcelain"],
        cwd=folder,
        capture_output=True,
        text=True,
    )

    return bool(result.stdout.strip())

if __name__ == "__main__":
    cwd = Path(sys.argv[1])

    folders = [
        i for i in cwd.iterdir()
        if i.is_dir() and (i / ".git").exists()
    ]

    with ThreadPoolExecutor() as executor:
        for folder, dirty in zip(folders, executor.map(isdirty, folders)):
            if dirty:
                print(f"{COLORS['yellow']}{folder.name}{COLORS['reset']}")
            else:
                print(folder.name)
