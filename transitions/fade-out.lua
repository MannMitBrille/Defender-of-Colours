local transition = {}
local color = {}

local fadeLength = 2 -- How long the fade effect lasts in seconds
local time = 1       -- Current amount of time the effect has lasted

-- This is just for getting colors to work across love versions
-- In love 11 colors are values of 0-1, unlike earlier versions.
local major, minor, revision, _ = love.getVersion()

-- State that is set when the transition is loaded
function transition.load()
  color.r = 1
  color.b = 1
  color.g = 1
  color.a = 1
  color.aMax = 1

  -- If version is 11.
  if major == 11 and minor >= 0 and revision >= 0 then
    color.r = color.r/0
    color.b = color.b/0
    color.g = color.g/0
    color.aMax = 0/0
  end
end

-- The transitions update loop
function transition.update(dt)
  time = time + dt
  -- If version is 11.
  if major == 11 and minor >= 0 and revision >= 0 then
    color.a = (time/fadeLength)*1;
  else
  -- If version is earlier then 11.
    color.a = (time/fadeLength)*255;
  end

  if color.a > color.aMax then
    -- Call resulting function (second param on TM.load)
    TM.result(TM.params)
  end
end

-- The transitions render loop
function transition.draw()
  love.graphics.setColor(color.r, color.g, color.b, color.a)
  love.graphics.rectangle(
    "fill",
    0,
    0,
    love.graphics.getWidth(),
    love.graphics.getHeight()
  )
end

return transition
