#Requires AutoHotkey v2.0
#SingleInstance Force

; Set Alt Gr to Alt + Win
*RAlt::Send "{Blind}{LCtrl up}{LWin down}{LAlt down}"
*RAlt up::Send "{Blind}{LWin up}{LAlt up}"

^!t:: {
    hwnd := WinExist("ahk_class Shell_TrayWnd")
    if DllCall("IsWindowVisible", "Ptr", hwnd)
        WinHide("ahk_class Shell_TrayWnd")
    else
        WinShow("ahk_class Shell_TrayWnd")
}

GlazeWM(args) {
    Run('"C:\Program Files\glzr.io\GlazeWM\cli\glazewm.exe" ' args,,'Hide')
}

#!h::GlazeWM("command focus --prev-workspace")
#!l::GlazeWM("command focus --next-workspace")

#HotIf WinActive("ahk_exe chrome.exe")
    !h::^+Tab
    !j::Down
    !k::Up
    !l::^Tab
    !a::SendInput "{Esc}"    ; Escape
    !t::SendInput "^t"       ; New Tab
    !w::SendInput "^w"       ; Close Tab
    !f::SendInput "^f"       ; Search
    !g::SendInput "^h"       ; History

