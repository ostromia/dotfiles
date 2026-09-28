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
		function(exitCode, stdOut, stdErr)
			print("exitCode:", exitCode)
			print("stdOut:", stdOut)
			print("stdErr:", stdErr)
		end,
		{ os.getenv("HOME") .. "/.config/applescript/aerospace-menubar.applescript" }
	):start()
end

spoon.LeftRightHotkey:bind({"rCmd"}, "1", AeroSpaceMenuBar)

spoon.LeftRightHotkey:start()
