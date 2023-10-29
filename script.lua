local Scene  = {}
function Scene:load()
  font = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",20)
  sound =  love.audio.newSource("Assets/Sounds/stamp.mp3","stream")
  timer = 3
timer = 8
dialog_setup("one evil scientist created a virus that turned color into black and white in the laboratory there was an accident due to which this virus killed the whole world in black and white and there are only seven colors left in the world you have a new job colors guard every day robbers attack and they want to steal and sell these colors your task is to prevent this!")
end
function Scene:update(dt)
   if timer >= 0 then
      timer = timer - dt
   else
    love.audio.play(sound)
      
     
   end
   if timer >= 0 then
      timer = timer - dt
   else
     
    
      dialog_update(dt)
   end
end
function Scene:draw()
 love.graphics.setFont(font)
   dialog_draw()
end
function dialog_setup(msg)
  dialog_message = msg
  dialog_length = 0
  dialog_speed = 10
  dialog_finished = false
  dialog_opened = true
end
function dialog_update(dt)
  dialog_length = dialog_length + dialog_speed * dt 
  if dialog_length > #dialog_message then
    dialog_finished = true
love.audio.stop(sound)
changeScene("battle")
    
  
  end
end
function dialog_draw()
  love.graphics.setFont(font)
  local msg = string.sub(dialog_message, 1, math.floor(dialog_length))
  love.graphics.printf(msg, 0, 0, 800, "left")
end
return Scene