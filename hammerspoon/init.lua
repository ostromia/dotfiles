hs.loadSpoon("LeftRightHotkey")

function AeroSpaceMenuBar()
	menuTap = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function()
		menuTap:stop()
		hs.timer.doAfter(0, function()
			hs.eventtap.keyStroke({}, "return", 0)
		end)
	end)

	menuTap:start()

	hs.task.new(
		"/usr/bin/osascript",
		nil,
		{
			"-e",
			'tell application "System Events" to tell process "AeroSpace" to click menu bar item 1 of menu bar 2'
		}
	):start()
end

spoon.LeftRightHotkey:bind({"rCmd"}, "1", AeroSpaceMenuBar)

spoon.LeftRightHotkey:start()
