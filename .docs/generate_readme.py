import os
import re

"""
notes for future self
the README consists of 4 sections:
    title & description
    software
    neovim plugins
    set up windows 11
each function appends its respective section to the README.md file
"""

def set_section_title_and_description(readmeMD):
    readmeMD.write("# dotfiles\n\ntrying to figure out how VimScript works\n\n")

def set_section_software(readmeMD, cwd):
    with open(cwd + r"\software.md", "r") as sectionMD:
        readmeMD.write(sectionMD.read())
        readmeMD.write("\n\n")

def set_section_neovim_plugins(readmeMD, cwd):
    readmeMD.write("## Neovim Plugins\n\n")

    with open(cwd + r"\..\nvim\init.vim") as initVIM:
        pattern = r"call plug#begin\(\)(.*?)call plug#end\(\)"
        vimplug = re.search(pattern, initVIM.read(), re.DOTALL)
        vimplug = vimplug.group(1).strip()

    for i in vimplug.split("\n"):
        pattern = r"Plug '(.*?)'"
        match = re.match(pattern, i)

        if match:
            pluginName = match.group(1)
            pluginURL = "https://github.com/" + pluginName
            readmeMD.write(f"- [{pluginName}]({pluginURL})\n")

    readmeMD.write("\n")

    initVIM.close()

def set_section_setup_windows_11(markdownFile):
    cwd = os.path.dirname(__file__)
    with open(cwd + r"\setup_windows_11.md") as file:
        markdownFile.write(file.read())

    markdownFile.write("\n")

if __name__ == "__main__":
    cwd = os.path.dirname(__file__)
    with open( cwd + r"\..\README.md", "w+" ) as readmeMD:
        set_section_title_and_description(readmeMD)
        set_section_software(readmeMD, cwd)
        set_section_neovim_plugins(readmeMD, cwd)
        set_section_setup_windows_11(readmeMD)
