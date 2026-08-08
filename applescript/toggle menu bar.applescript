-- https://www.reddit.com/r/MacOS/comments/we8ztm/comment/n25z8sp/

tell application "System Events"
	set frontApp to name of first application process whose frontmost is true
end tell

if application "System Settings" is running then
	try
		tell application "System Settings" to quit
	on error
		do shell script "killall 'System Settings'"
	end try
	delay 0.2
end if

repeat while application "System Settings" is running
	delay 0.2
end repeat

do shell script "open 'x-apple.systempreferences:com.apple.ControlCenter-Settings.extension'"
delay 1.0
tell application "System Settings" to activate

set fullScreen to "In Full Screen Only"
set never to "Never"

tell application "System Events"
	tell application process "System Settings"
		set t0 to (current date)
		repeat until exists (pop up button 1 of group 9 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Control Center")
			if (current date) - t0 > 10 then error "Timed out waiting for menu"
			delay 0.1
		end repeat
		
		set thePopup to pop up button 1 of group 9 of scroll area 1 of group 1 of group 2 of splitter group 1 of group 1 of window "Control Center"
		set currentChoice to value of thePopup
		click thePopup
		delay 0.2
		
		if currentChoice is never then
			click menu item fullScreen of menu 1 of thePopup
		else
			click menu item never of menu 1 of thePopup
		end if
	end tell
end tell

delay 0.3
tell application "System Settings" to quit
delay 0.2
tell application frontApp to activate