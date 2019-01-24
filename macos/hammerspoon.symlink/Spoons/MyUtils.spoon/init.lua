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

function obj:getPacerIdFromFabric()
  for i = 20, 1, -1 do
    hs.eventtap.leftClick({x=-1298.46484375, y=240.7109375},100000)
    hs.timer.usleep(1200000)
    doubleLeftClick({  x = -1238.62109375, y = 619.53125})
    hs.eventtap.keyStroke({"cmd"}, "c")
    hs.timer.usleep(200000)
    local pacer_id = hs.pasteboard.getContents()
    file = io.open("/Users/eggcaker/Desktop/pacer_id.txt", "a")
    file:write(pacer_id, "\n")
    file:close()
    hs.timer.usleep(500000)
  end
end

function obj:shareFileToAirDrop(filePath)
  airDrop = hs.sharing.newShare("com.apple.share.AirDrop.send")
  airDrop:subject("Send file" .. os.date()):recipients({})
  file = hs.sharing.fileURL(filePath)
  airDrop:shareItems({ [[ "Send file"]], file})
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
  hs.keycodes.currentSourceID("com.aodaren.inputmethod.Qingg")
end

function English()
  hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
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
