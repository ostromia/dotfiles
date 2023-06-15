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
    !e::SendInput "^+t"      ; Reopen closed tab
    !p::SendInput "^{Space}" ; Quick Commands
    !f::SendInput "^f"       ; Search
    !g::SendInput "^h"       ; History

#HotIf WinActive("ahk_exe java.exe")
    !h::SendInput "^+{TAB}"
    !l::SendInput "^{Tab}"

    !q::SendInput "^w"

    !b::SendInput "^b"
    
    !+e::SendInput "{F6}"
    !j::SendInput "{F7}"
    !m::SendInput "{F8}"

