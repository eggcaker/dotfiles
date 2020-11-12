local function Chinese()
  print("enable Chinese")
  hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Rime")
end

local function English()
  print("enable English")
  hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

-- app to expected ime config
local app2Ime = {
  WeChat="Chinese",
  iTerm2 = "English",
  kitty = "English",
  Xcode = "English",
  ["Google Chrome"]  ="Chinese",
  Finder = "English",
  ["System Preferences"] = "English",
  Preview = "Chinese",
  Emacs = "English"
}

function updateFocusAppInputMethod()
    local focusAppPath = hs.window.frontmostWindow():application():name()
    ime = app2Ime[focusAppPath]
    if ime == 'Chinese' then
      Chinese()
    else
      English()
    end
end

-- helper hotkey to figure out the app path and name of current focused window
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
    hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)

-- Handle cursor focus and application's screen manage.
function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        updateFocusAppInputMethod()
    end
end

appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
