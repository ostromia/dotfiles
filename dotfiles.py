import json
import sys
import platform
from pathlib import Path
import shutil

CWD = Path(__file__).resolve().parent

with open(CWD / ".dotfiles" / "dotfiles.json") as f:
    SOFTWARE: dict[str, list[dict[str, str | list[str]]]] = json.load(f)

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

def log(software: list[dict[str, Path | list[str]]]) -> None:
    for i, item in enumerate(software):
        print(f"[{i}]")
        for key, value in item.items():
            print(f"  {key}: {value}")

def install(software: list[dict[str, Path | list[str]]]):
    for i in software:
        copy(
            i["source"],
            i["target"],
            include=i.get("include"),
            exclude=i.get("exclude"),
        )

def backup(software: list[dict[str, Path | list[str]]]):
    for i in software:
        copy(
            i["target"],
            i["source"],
            include=i.get("include"),
            exclude=i.get("exclude"),
        )

if __name__ == "__main__":
    software2 = SOFTWARE["windows"] if platform.system() == "Windows" else SOFTWARE["macos"]
    software3 = []

    for i in software2:
        entry = {
            "source": Path(i["source"]).expanduser(),
            "target": Path(i["target"]).expanduser(),
        }
        if "include" in i:
            entry["include"] = i["include"]
        if "exclude" in i:
            entry["exclude"] = i["exclude"]
        software3.append(entry)

    if len(sys.argv) != 2:
        sys.exit(f"Usage: {sys.argv[0]} [install|backup]")

    argument = sys.argv[1].lower()

    if argument == "install":
        install(software3)
    elif argument == "backup":
        backup(software3)

