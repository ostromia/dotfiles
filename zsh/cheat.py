import sys
from pathlib import Path

if __name__ == "__main__":
    file = Path(__file__).parent / "cheat.md"
    lines = file.read_text().splitlines()
    
    result = {}
    current_section = None
 
    for i in range(len(lines)):
        line = lines[i].strip()

        if line.startswith("##"):
            name = line[3:].strip()
            current_section = line[3:]

        if line.endswith(":"):
            if current_section not in result.keys():
                result[current_section] = []

            result[current_section].append(
                {
                    "description": line[:-1],
                    "command": lines[i + 1].replace("`", "").strip()
                }
            )

    commands = tuple(
        i.replace("## ", "") for i in lines
        if "##" in i
    )


    command = sys.argv[2]

    for i in result[command]:
        print(f"{i['command']} # {i['description']}")
    
