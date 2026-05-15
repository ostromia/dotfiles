#Requires AutoHotkey v2.0
#SingleInstance Force

; Set Alt Gr to Alt + Win
*RAlt::Send "{Blind}{LCtrl up}{LWin down}{LAlt down}"
*RAlt up::Send "{Blind}{LWin up}{LAlt up}"

<^>!u::{
    Send "{Shift down}{left 4}{Shift up}^c{Del 4}"
    Sleep 10
    Send "{U+" . A_Clipboard . "}"
}

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

