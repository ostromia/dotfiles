#Requires AutoHotkey v2.0

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

