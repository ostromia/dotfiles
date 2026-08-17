import tomllib
import sys
import platform
from pathlib import Path
import shutil
import subprocess

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

    autohotkey = next(
        d for d in software
        if d["source"].name == "autohotkey"
    )

    config_file = autohotkey["target"] / "config.ahk"

    subprocess.Popen(
        [
            Path(r"~\AppData\Local\Programs\AutoHotkey\v2\AutoHotkey64.exe").expanduser(),
            Path(r"~\.config\autohotkey\config.ahk").expanduser()
        ]
    )

def get_dotfile_paths():
    # TODO rewrite

    CWD = Path(__file__).resolve().parent

    with open(CWD / ".dotfiles" / "dotfiles.toml", "rb") as f:
        dotfiles = tomllib.load(f)

    # OS =
    system = "windows" if platform.system() == "Windows" else "macos"

    result = []

    for i in dotfiles.values():
        target = i["target"]

        if isinstance(target, dict):
            if system not in target:
                continue
            target = target[system]

        # :(
        result.append({
            **{k: v for k, v in i.items() if k not in ("source", "target")},
            "source": Path(i["source"]).expanduser(),
            "target": Path(target).expanduser(),
        })

    return result

def check_command_usage_and_return_argv_1():
    match sys.argv[1:]:
        case []:
            return "install"
        case [i] if i.lower() in ("install", "backup"):
            return i.lower()
    sys.exit(f"Usage: {sys.argv[0]} <install|backup>")

if __name__ == "__main__":
    argument = check_command_usage_and_return_argv_1()
    dotfiles = get_dotfile_paths()

    if argument == "install":
        install(dotfiles)
    else:
        backup(dotfiles)

