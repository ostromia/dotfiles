#Requires AutoHotkey v2.0
#SingleInstance Force

class std {
    class array {
        static sort(x) {
            str := ""
            for val in x
                str .= val "`n"
            str := Sort(RTrim(str, "`n"))
            sorted := StrSplit(str, "`n")
            x.Length := 0
            for val in sorted
                x.Push(val)
            return x
        }
    }

    class map {
        static keys(x) {
            keys := []
            for k in x
                keys.Push(k)
            return keys
        }
    }
}

getApps() {
    StartMenuPaths := [
        "C:\ProgramData\Microsoft\Windows\Start Menu\Programs",
        A_AppData "\Microsoft\Windows\Start Menu\Programs"
    ]

    apps := []
    for path in StartMenuPaths {
        loop files, path "\*.lnk", "R" {
            name := SubStr(A_LoopFileName, 1, -4)
            iconFile := "", iconNum := 0, target := ""
            try FileGetShortcut(A_LoopFileFullPath, &target, , , , &iconFile, &iconNum)
            if iconFile = ""
                iconFile := target
            apps.Push(Map(
                "name", name,
                "path", A_LoopFileFullPath,
                "icon", Map("file", iconFile, "num", iconNum)
            ))
        }
    }

    return apps
}

global Launcher := { gui: "", input: "", list: "", byName: "", allNames: "", iconIndex: "", visibleNames: "" }

populate(names) {
    Launcher.list.Delete()
    for name in names
        Launcher.list.Add("Icon" Launcher.iconIndex[name], name)
    Launcher.list.ModifyCol(1, 480)
}

open(*) {
    idx := Launcher.list.GetNext(0, "F")
    if !idx
        idx := 1
    if idx > Launcher.visibleNames.Length
        return
    name := Launcher.visibleNames[idx]
    target := Launcher.byName[name]["path"]
    Launcher.gui.Hide()
    Run('"' . target . '"')
}

filter(*) {
    query := StrLower(Launcher.input.Value)
    visibleNames := []
    for name in Launcher.allNames {
        if query = "" || InStr(StrLower(name), query)
            visibleNames.Push(name)
    }
    Launcher.visibleNames := visibleNames
    populate(visibleNames)
    if visibleNames.Length
        Launcher.list.Modify(1, "Select Focus")
}

BuildLauncher() {
    apps := getApps()
    byName := Map()
    for app in apps
        byName[app["name"]] := app
    Launcher.byName := byName
    Launcher.allNames := std.array.sort(std.map.keys(byName))
    Launcher.visibleNames := Launcher.allNames.Clone()

    g := Gui("+AlwaysOnTop -Caption +ToolWindow", "Launcher")
    g.SetFont("s11", "Segoe UI")
    g.BackColor := "1E1E1E"
    g.MarginX := 10
    g.MarginY := 10
    Launcher.gui := g

    IL := IL_Create(Launcher.allNames.Length, 1, false)
    iconIndex := Map()
    for name in Launcher.allNames {
        icon := byName[name]["icon"]
        idx := 0
        if icon["file"] != ""
            try idx := IL_Add(IL, icon["file"], icon["num"] ? icon["num"] : 1)
        iconIndex[name] := idx
    }
    Launcher.iconIndex := iconIndex

    Launcher.input := g.AddEdit("w500 Background2D2D2D cWhite -E0x200")
    Launcher.list := g.AddListView("w500 h250 -Hdr -Multi +NoSortHdr Background2D2D2D cWhite -E0x200", ["Name"])
    Launcher.list.SetImageList(IL, 1)

    populate(Launcher.visibleNames)
    if Launcher.visibleNames.Length
        Launcher.list.Modify(1, "Select Focus")

    Launcher.input.OnEvent("Change", filter)
    Launcher.list.OnEvent("DoubleClick", open)

    HotIfWinActive("ahk_id " g.Hwnd)
        Hotkey("Enter", open, "On")
        Hotkey("Escape", (*) => g.Hide())
    HotIfWinActive()
}

ShowLauncher() {
    if !Launcher.gui
        BuildLauncher()
    else {
        Launcher.input.Value := ""
        filter()
    }
    Launcher.gui.Show("AutoSize Center")
    Launcher.input.Focus()
}

BuildLauncher()

#Space:: ShowLauncher()
