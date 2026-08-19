#Requires AutoHotkey v2.0
#SingleInstance Force

; # Win
; ! Alt
; ^ Ctrl
; + Shift

CapsLock::Esc

F1::{
    KeyHistory
}

<!a::Send "{LCtrl down}a{LCtrl up}"
<!c::Send "{LCtrl down}c{LCtrl up}"
<!v::Send "{LCtrl down}v{LCtrl up}"

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

; temporarily window keybinds
<!1::Send "{LAlt up}{LWin down}1{LWin up}"
<!2::Send "{LAlt up}{LWin down}2{LWin up}"
<!3::Send "{LAlt up}{LWin down}3{LWin up}"
<!4::Send "{LAlt up}{LWin down}4{LWin up}"
<!5::Send "{LAlt up}{LWin down}5{LWin up}"
<!6::Send "{LAlt up}{LWin down}6{LWin up}"
<!7::Send "{LAlt up}{LWin down}7{LWin up}"
<!8::Send "{LAlt up}{LWin down}8{LWin up}"
<!9::Send "{LAlt up}{LWin down}9{LWin up}"
<!0::Send "{LAlt up}{LWin down}0{LWin up}"

; Helium
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

; File Pilot
#HotIf WinActive("ahk_exe FPilot.exe")
    !h::^+Tab
    !+h::!Left
    !j::Down
    !k::Up
    !l::^Tab
    !+l::!Right
    !p::^+p
    !o::^p
    !w::^w
    !t::^t

