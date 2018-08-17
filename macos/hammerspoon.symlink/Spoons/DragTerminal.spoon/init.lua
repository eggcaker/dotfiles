local obj = {}
obj.__index = obj

obj.name = "DragTerminals-Spoon"
obj.version = "1.0"
obj.author = "eggcaker <eggcaker@gmail.com>"
obj.homepage = "http://github.com/eggcaker"
obj.license = "MIT - https://opensource.org/licenses/MIT"


local fromPoint = nil
local color = {hex='#81ecec', alpha=0.5}
local color = {hex='#00cec9', alpha=0.5}
local strokeColor ={hex='#00cec9', alpha=1.0}

local rectanglePreview = hs.drawing.rectangle(hs.geometry.rect(0, 0, 0, 0))
rectanglePreview:setStrokeWidth(2)
rectanglePreview:setStrokeColor(strokeColor)
rectanglePreview:setFillGradient(color, endColor, 45)
rectanglePreview:setRoundedRectRadii(2, 2)
rectanglePreview:setStroke(true):setFill(true)
rectanglePreview:setLevel("floating")


function obj:init()
  local drag_event = hs.eventtap.new(
    { hs.eventtap.event.types.mouseMoved },
    function(e)
      local toPoint = hs.mouse.getAbsolutePosition()
      local newFrame = hs.geometry.new({
          x1 = fromPoint.x,
          y1 = fromPoint.y,
          x2 = toPoint.x,
          y2 = toPoint.y,
      })
      rectanglePreview:setFrame(newFrame)

      return nil
    end
  )

  local flags_event = hs.eventtap.new(
    { hs.eventtap.event.types.flagsChanged },
    function(e)
      local flags = e:getFlags()
      if flags.ctrl and flags.shift then
        fromPoint = hs.mouse.getAbsolutePosition()
        local startFrame = hs.geometry.rect(fromPoint.x, fromPoint.y, 0, 0)
        rectanglePreview:setFrame(startFrame)
        drag_event:start()
        rectanglePreview:show()
      elseif fromPoint ~= nil then
        fromPoint = nil
        drag_event:stop()
        rectanglePreview:hide()
        obj:openIterm()
      end
      return nil
    end)

  flags_event:start()
end

function obj:openIterm()
  local frame = rectanglePreview:frame()
  local createItermWithBounds = string.format([[
    if application "iTerm" is not running then
      launch application "iTerm"
    end if
    tell application "iTerm"
      set newWindow to (create window with default profile)
      set the bounds of newWindow to {%i, %i, %i, %i}
    end tell
  ]], frame.x, frame.y, frame.x + frame.w, frame.y + frame.h)
  hs.osascript.applescript(createItermWithBounds)
end

return obj
