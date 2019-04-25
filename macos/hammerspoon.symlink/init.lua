hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0
hs.application.enableSpotlightForNameSearches(true)
hs.ipc.cliInstall()

-- Define monitor names for layout purposes
display_mbp = "Color LCD"
display_monitor = "SwitchResX4 - DELL P2416D"

hostname = hs.host.localizedName()
hyper = {"cmd", "alt", "ctrl", "shift"}

-- Draw pretty rounded corners on all screens
hs.loadSpoon("RoundedCorners")
spoon.RoundedCorners:start()


-- ModalMgr Spoon must be loaded explicitly
hs.loadSpoon("ModalMgr")

hspoon_list = {
  -- "CircleClock",
  -- "HCalendar",
  "UnsplashZ",
  "WinWin",
  "Astrill",
  "Seal",
  -- "DragTerminal",
  "MyUtils",
  "Office"
}

-- Load those Spoons
for _, v in pairs(hspoon_list) do
  hs.loadSpoon(v)
end

hswhints_keys = {hyper, "tab"}
if string.len(hswhints_keys[2]) > 0 then
  spoon.ModalMgr.supervisor:bind(hswhints_keys[1], hswhints_keys[2], 'Show Window Hints', function()
                                   spoon.ModalMgr:deactivateAll()
                                   hs.hints.windowHints()
  end)
end


-- resizeM modal environment
if spoon.WinWin then
  spoon.ModalMgr:new("resizeM")
  local cmodal = spoon.ModalMgr.modal_list["resizeM"]
  cmodal:bind('', 'escape', 'Deactivate resizeM', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
  cmodal:bind('', 'Q', 'Deactivate resizeM', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
  cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)
  cmodal:bind('', 'A', 'Move Leftward', function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
  cmodal:bind('', 'D', 'Move Rightward', function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
  cmodal:bind('', 'W', 'Move Upward', function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
  cmodal:bind('', 'S', 'Move Downward', function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)
  cmodal:bind('', 'H', 'Lefthalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfleft") end)
  cmodal:bind('', 'L', 'Righthalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfright") end)
  cmodal:bind('', 'K', 'Uphalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfup") end)
  cmodal:bind('', 'J', 'Downhalf of Screen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("halfdown") end)
  cmodal:bind('', 'Y', 'NorthWest Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNW") end)
  cmodal:bind('', 'O', 'NorthEast Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerNE") end)
  cmodal:bind('', 'U', 'SouthWest Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSW") end)
  cmodal:bind('', 'I', 'SouthEast Corner', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("cornerSE") end)
  cmodal:bind('', 'M', 'Fullscreen', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("fullscreen") end)
  cmodal:bind('', 'C', 'Center Window', function() spoon.WinWin:stash() spoon.WinWin:moveAndResize("center") end)
  cmodal:bind('', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
  cmodal:bind('', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)
  cmodal:bind('shift', 'H', 'Move Leftward', function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
  cmodal:bind('shift', 'L', 'Move Rightward', function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
  cmodal:bind('shift', 'K', 'Move Upward', function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
  cmodal:bind('shift', 'J', 'Move Downward', function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)
  cmodal:bind('', 'left', 'Move to Left Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("left") end)
  cmodal:bind('', 'right', 'Move to Right Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("right") end)
  cmodal:bind('', 'up', 'Move to Above Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("up") end)
  cmodal:bind('', 'down', 'Move to Below Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("down") end)
  cmodal:bind('', 'space', 'Move to Next Monitor', function() spoon.WinWin:stash() spoon.WinWin:moveToScreen("next") end)
  cmodal:bind('', '[', 'Undo Window Manipulation', function() spoon.WinWin:undo() end)
  cmodal:bind('', ']', 'Redo Window Manipulation', function() spoon.WinWin:redo() end)
  cmodal:bind('', '`', 'Center Cursor', function() spoon.WinWin:centerCursor() end)

  -- Register resizeM with modal supervisor
  hsresizeM_keys = {"cmd", "space"}
  if string.len(hsresizeM_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "Enter resizeM Environment", function()
                                     -- Deactivate some modal environments or not before activating a new one
                                     spoon.ModalMgr:deactivateAll()
                                     -- Show an status indicator so we know we're in some modal environment now
                                     spoon.ModalMgr:activate({"resizeM"}, "#B2b2b2")
    end)
  end
end

-- Astrill Vpn Toggle
if spoon.Astrill then
  hsastrill_enable_keys = {hyper, "E"}
  hsastrill_disable_keys = {hyper, "D"}
  spoon.ModalMgr.supervisor:bind(hsastrill_enable_keys[1],
                                 hsastrill_enable_keys[2], 'Enable Astrill',
                                 function() spoon.Astrill:enable() end)

  spoon.ModalMgr.supervisor:bind(hsastrill_disable_keys[1],
                                 hsastrill_disable_keys[2],
                                 'Disable Astrill', function()
                                   spoon.Astrill:disable() end)
end


----------------------------------------------------------------------------------------------------
-- Register Hammerspoon console
hsconsole_keys = hsconsole_keys or {"alt", "Z"}
if string.len(hsconsole_keys[2]) > 0 then
  spoon.ModalMgr.supervisor:bind(hsconsole_keys[1], hsconsole_keys[2], "Toggle Hammerspoon Console", function() hs.toggleConsole() end)
end

----------------------------------------------------------------------------------------------------
-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()



-- Defines for screen watcher
lastNumberOfScreens = #hs.screen.allScreens()

-- Define window layouts
--   Format reminder:
--     {"App name", "Window name", "Display Name", "unitrect", "framerect", "fullframerect"},
dual_display = {
  {"iTerm2",        nil, display_monitor, hs.geometry.unitrect(0,   0,   1.0,   1.0),  nil, nil}, 
  {"Emacs",         nil, display_monitor, hs.geometry.unitrect(0,   0,   1.0,   1.0),  nil, nil}, 
  {"Google Chrome", nil, display_monitor, hs.geometry.unitrect(0,   0,   1.0,   1.0),  nil, nil}, 
  {"Trello",        nil, display_mbp,     hs.geometry.unitrect(0.5, 0.5, 0.5,   0.5),  nil, nil}, 
  {"Preview",       nil, display_mbp,     hs.geometry.unitrect(0,   0,   1.0,   1.0),  nil, nil}, 
  {"WeChat",        nil, display_mbp, hs.geometry.unitrect(0,   0,   0.5, 0.5), nil, nil}, 
}

-- And now for hotkeys relating to Hyper. First, let's capture all of the functions, then we can just quickly iterate and bind them
hyperfns = {}

hyperfns['2'] = function() hs.layout.apply(dual_display) end

for _hotkey, _fn in pairs(hyperfns) do
  hs.hotkey.bind(hyper, _hotkey, _fn)
end


-- use seal
spoon.Seal:loadPlugins({"apps", "calc", "urlformats", "useractions" })
spoon.Seal:bindHotkeys({show={{"alt"}, "Space"}})
spoon.Seal:start()


spoon.Seal.plugins.useractions.actions =
  {
    ["Hammerspoon docs webpage"] = {
      url = "http://hammerspoon.org/docs/",
      icon = hs.image.imageFromName(hs.image.systemImageNames.ApplicationIcon),
      hotkey = { hyper, "h" }
    },
    ["Translate using Leo"] = {
      url = "http://dict.leo.org/ende/index_de.html#/search=${query}",
      icon = 'favicon',
      keyword = "leo",
    }
  }


hs.loadSpoon('Ki')
spoon.Ki.workflowEvents = {...}
spoon.Ki:start()

spoon.Office:start()

hs.hotkey.bind(hyper, "R", "Reload Configuration", function() hs.reload() end)


function keyStrokes(str)
  return function()
    hs.eventtap.keyStrokes(str)
  end
end
hs.hotkey.bind({"alt", "cmd"}, "L", keyStrokes("console.log("))

