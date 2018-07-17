-- Specify Spoons which will be loaded
hspoon_list = {
    "AClock",
    --"BingDaily",
    -- "Calendar",
    "CircleClock",
    "ClipShow",
    --"CountDown",
    -- "FnMate",
    "HCalendar",
    "HSearch",
    -- "KSheet",
    -- "SpeedMenu",
    -- "TimeFlow",
    -- "UnsplashZ",
    "WinWin",
}

-- appM environment keybindings. Bundle `id` is prefered, but application `name` will be ok.
hsapp_list = {
    {key = 'a', name = 'Android Studio 3.2 Preview'},
    {key = 'c', id = 'com.google.Chrome'},
    {key = 'd', name = 'ShadowsocksX'},
    {key = 'e', name = 'Emacs'},
    {key = 'f', name = 'Finder'},
    {key = 'i', name = 'iTerm'},
    {key = 'k', name = 'KeyCastr'},
    {key = 'l', name = 'Sublime Text'},
    {key = 'm', name = 'MacVim'},
    {key = 'o', name = 'LibreOffice'},
    {key = 'p', name = 'mpv'},
    {key = 'r', name = 'VimR'},
    {key = 's', name = 'Safari'},
    {key = 't', name = 'iTerm2'},
    {key = 'v', id = 'com.apple.ActivityMonitor'},
    {key = 'w', name = 'Mweb'},
    {key = 'y', id = 'com.apple.systempreferences'},
}

-- Modal supervisor keybinding, which can be used to temporarily disable ALL modal environments.
hsupervisor_keys = {{"cmd", "shift", "ctrl"}, "Q"}

-- Reload Hammerspoon configuration
hsreload_keys = {{"cmd", "shift", "ctrl"}, "R"}

-- Toggle help panel of this configuration.
hshelp_keys = {{"alt", "shift"}, "/"}

----------------------------------------------------------------------------------------------------
-- Those keybindings below could be disabled by setting to {"", ""} or {{}, ""}

-- Window hints keybinding: Focuse to any window you want
hswhints_keys = {"alt", "tab"}

-- appM environment keybinding: Application Launcher
hsappM_keys = {"alt", "A"}

-- clipshowM environment keybinding: System clipboard reader
hsclipsM_keys = {"alt", "C"}

-- Launch Hammerspoon Search
hsearch_keys = {"alt", "G"}

-- Read Hammerspoon and Spoons API manual in default browser
hsman_keys = {"alt", "H"}

-- countdownM environment keybinding: Visual countdown
hscountdM_keys = {"alt", "I"}

-- Lock computer's screen
hslock_keys = {"alt", "L"}

-- resizeM environment keybinding: Windows manipulation
hsresizeM_keys = {"alt", "R"}

-- cheatsheetM environment keybinding: Cheatsheet copycat
hscheats_keys = {"alt", "S"}

-- Show digital clock above all windows
hsaclock_keys = {"alt", "T"}

-- Type the URL and title of the frontmost web page open in Google Chrome or Safari.
hstype_keys = {"alt", "V"}

-- Toggle Hammerspoon console
hsconsole_keys = {"alt", "Z"}

-- Input state auto toggle
local function Chinese()
  hs.keycodes.currentSourceID("com.aodaren.inputmethod.Qingg")
end

local function English()
  hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
end

local function set_app_input_method(app_name, set_input_method_function, event)
  event = event or hs.window.filter.windowFocused

  hs.window.filter.new(app_name)
    :subscribe(event, function()
                 set_input_method_function()
              end)
end

set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
set_app_input_method('Spotlight', English, hs.window.filter.windowCreated)
set_app_input_method('Alfred', English, hs.window.filter.windowCreated)
set_app_input_method('Emacs', English)
set_app_input_method('iTerm2', English)
set_app_input_method('Google Chrome', English)
set_app_input_method('Android Studio', English)
set_app_input_method('WeChat', Chinese)


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
