local obj = {}
obj.__index = obj

obj.name = "Office-Spoon"
obj.version = "1.0"
obj.author = "eggcaker <eggcaker@gmail.com>"
obj.homepage = "http://github.com/eggcaker"
obj.license = "MIT - https://opensource.org/licenses/MIT"


function obj:start()
  local workWifi = '西北角'
  local outputDeviceName = 'Built-in Output'
  hs.wifi.watcher.new(function()
      local currentWifi = hs.wifi.currentNetwork()
      local currentOutput = hs.audiodevice.current(false)
      if not currentWifi then return end
      if (currentWifi == workWifi and currentOutput.name == outputDeviceName) then
        hs.audiodevice.findDeviceByName(outputDeviceName):setOutputMuted(true)
      end
  end):start()
end

return obj
