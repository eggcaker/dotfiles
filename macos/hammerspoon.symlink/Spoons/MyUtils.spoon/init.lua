local obj = {}
obj.__index = obj

obj.name = "MyUtils-Spoon"
obj.version = "1.0"
obj.author = "eggcaker <eggcaker@gmail.com>"
obj.homepage = "http://github.com/eggcaker"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
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

return obj
