#Requires AutoHotkey v2.0
#SingleInstance Force

global Commands := Map(
    "Open Notepad", () => Run("notepad.exe")
)

BuildCommandPaletteGui(items) {
    palette := Gui("+AlwaysOnTop -Caption +ToolWindow", "Command Palette")
    palette.SetFont("s11", "Segoe UI")
    palette.BackColor := "1E1E1E"
    palette.MarginX := 10
    palette.MarginY := 10

    input := palette.AddEdit("w500 Background2D2D2D cWhite -E0x200")

    list := palette.AddListBox("w500 h250 Background2D2D2D cWhite -E0x200", items)

    return { palette: palette, input: input, list: list }
}

ShowCommandPalette() {
    allNames := []
    for name in Commands
        allNames.Push(name)

    visibleNames := allNames.Clone()

    ui := BuildCommandPaletteGui(visibleNames)
    palette := ui.palette
    input := ui.input
    list := ui.list

    if visibleNames.Length
        list.Choose(1)

    runSelected(*) {
        idx := list.Value
        if !idx
            return
        name := visibleNames[idx]
        palette.Destroy()
        Commands[name].Call()
    }

    filter(*) {
        query := StrLower(input.Value)
        visibleNames := []
        for name in allNames {
            if query = "" || InStr(StrLower(name), query)
                visibleNames.Push(name)
        }
        list.Delete()
        list.Add(visibleNames)
        if visibleNames.Length
            list.Choose(1)
    }

    input.OnEvent("Change", filter)
    list.OnEvent("DoubleClick", runSelected)

    HotIfWinActive("ahk_id " palette.Hwnd)
    Hotkey("Enter", runSelected, "On")
    Hotkey("Escape", (*) => palette.Destroy(), "On")
    HotIfWinActive()

    palette.OnEvent("Escape", (*) => palette.Destroy())
    palette.Show("AutoSize Center")
    input.Focus()
}

#Space::ShowCommandPalette()
