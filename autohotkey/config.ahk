#Requires AutoHotkey v2.0
#SingleInstance Force

CoordMode "Mouse", "Screen"
SCREENWIDTH := SysGet(78)
SCREENHEIGHT := SysGet(79)

<^>!u::{
    Send "{Shift down}{left 4}{Shift up}^c{Del 4}"
    Sleep 10
    Send "{U+" . A_Clipboard . "}"
}

#s::{
    Send "{PrintScreen}" 
    Sleep 500
    mousepressed := 0
    loop {
        sleep 10
        if (GetKeyState("Esc", "P") = 1) {
            break
        }
        else if (GetKeyState("LButton","P") = 1) {
            mousepressed := 1
        }
        else {
            if (mousepressed = 1) {
                Sleep 1000
                MouseGetPos &mouseX, &mouseY
                Click SCREENWIDTH - 250, SCREENHEIGHT - 250
                MouseMove mouseX, mouseY
                break
            }
        }
    }
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

