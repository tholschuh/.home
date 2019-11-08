hs.hotkey.bind("ctrl", "1", function() fullscreenWindow() end)
hs.hotkey.bind("ctrl", "2", function() moveWindowToLeftHalf() end)
hs.hotkey.bind("ctrl", "3", function() moveWindowToRightHalf() end)

function fullscreenWindow()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end

function moveWindowToLeftHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function moveWindowToRightHalf()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.launched) then
        if (appName == "kitty" or
            appName == "Firefox") then
            fullscreenWindow()
        end
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
