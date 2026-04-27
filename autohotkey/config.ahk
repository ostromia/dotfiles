#Requires AutoHotkey v2.0
#SingleInstance Force

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
    !w::SendInput "^t"       ; New Tab
    !q::SendInput "^w"       ; Close Tab
    !f::SendInput "^f"       ; Search
    !g::SendInput "^h"       ; History

