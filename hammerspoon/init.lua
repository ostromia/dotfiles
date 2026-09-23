hs.loadSpoon("LeftRightHotkey")

spoon.LeftRightHotkey:bind({"rCmd"}, "1", function()
  hs.alert.show("Right ⌘1")
end)

spoon.LeftRightHotkey:start()
