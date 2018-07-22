local obj = {}
obj.__index = obj

obj.name = "Astrill-Spoon"
obj.version = "1.0"
obj.author = "eggcaker <eggcaker@gmail.com>"
obj.homepage = "http://github.com/eggcaker"
obj.license = "MIT - https://opensource.org/licenses/MIT"

function obj:init()
  hs.urlevent.bind('disablevpn', function(event, p) self:disable() end)
  hs.urlevent.bind('enablevpn', function(event, p) self:enable() end)
end

-- TODO: cannot bind from init.lua, still don't konw why
function obj:bindHotkeys(map)
  if (self.hotkey) then
    self.hotkey:delete()
  end

  hs.logger:d(map)
  for fn, mod_key in pairs(map) do
    local mods = mod_key[1]
    local ley = mod_key[2]
    hs.hotkey.bind(mods, key, function() self[fn](self) end)
  end

end

function obj:enable()
  local toggleON = {"Menu", "Toggle ON"}
  -- hs.application.launchOrFocusByBundleID('com.astrill.astrill')
  app = hs.appfinder.appFromName("Astrill")
  if (app:findMenuItem(toggleON)) then
    app:selectMenuItem(toggleON)
  end
end

function obj:disable()
  local toggleOFF= {"Menu", "Toggle OFF"}
  -- hs.application.launchOrFocusByBundleID('com.astrill.astrill')
  app = hs.appfinder.appFromName("Astrill")
  if (app:findMenuItem(toggleOFF)) then
    app:selectMenuItem(toggleOFF)
  end
end

return obj
