local obj = {}
obj.__index = obj

obj.name = "MyUtils-Spoon"
obj.version = "1.0"
obj.author = "eggcaker <eggcaker@gmail.com>"
obj.homepage = "http://github.com/eggcaker"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
end


function obj:start()
  obj.set_app_input_method('Hammerspoon', English, hs.window.filter.windowCreated)
  obj.set_app_input_method('Spotlight', English, hs.window.filter.windowCreated)
  obj.set_app_input_method('Alfred', English, hs.window.filter.windowCreated)
  obj.set_app_input_method('Emacs', English)
  obj.set_app_input_method('iTerm2', English)
  obj.set_app_input_method('Google Chrome', English)
  obj.set_app_input_method('Android Studio', English)
  obj.set_app_input_method('WeChat', Chinese)
end

function obj:bindHotkeys(mapping)
  if (self.hotkey) then
    self.hotkey:delete()
  end

  for fn, mod_key in pairs(mapping) do
    local mods = mod_key[1]
    local ley = mod_key[2]
    hs.hotkey.bind(mods, key, function() self[fn](self) end)
  end
end

local function doubleLeftClick(point)
  local clickState = hs.eventtap.event.properties.mouseEventClickState
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseDown"], point):setProperty(clickState, 1):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseUp"], point):setProperty(clickState, 1):post()
  hs.timer.usleep(1000)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseDown"], point):setProperty(clickState, 2):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseUp"], point):setProperty(clickState, 2):post()
end


-- Input state auto toggle
function Chinese()
  hs.keycodes.currentSourceID("im.rime.inputmethod.Squirrel.Rime")
end

function English()
  hs.keycodes.currentSourceID("com.apple.keylayout.US")
end

function obj.set_app_input_method(app_name, set_input_method_function, event)
  event = event or hs.window.filter.windowFocused

  hs.window.filter.new(app_name)
    :subscribe(event, function()
                 set_input_method_function()
              end)
end

function obj:showSourceID()
  hs.alert.show("App path:        "
                  ..hs.window.focusedWindow():application():path()
                  .."\n"
                  .."App name:      "
                  ..hs.window.focusedWindow():application():name()
                  .."\n"
                  .."IM source id:  "
                  ..hs.keycodes.currentSourceID())
end


return obj
