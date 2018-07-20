hs.hotkey.bind({}, 'f15', function()
    for i = 100, 1, -1 do
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
end)


function doubleLeftClick(point)
  local clickState = hs.eventtap.event.properties.mouseEventClickState
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseDown"], point):setProperty(clickState, 1):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseUp"], point):setProperty(clickState, 1):post()
  hs.timer.usleep(1000)
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseDown"], point):setProperty(clickState, 2):post()
  hs.eventtap.event.newMouseEvent(hs.eventtap.event.types["leftMouseUp"], point):setProperty(clickState, 2):post()
end
