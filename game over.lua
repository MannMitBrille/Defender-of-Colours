local Scene  = {}
function Scene:load()
  font = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",50)
  font2 = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",40)
end
function Scene:update(dt)
  
end
function Scene:draw()
  love.graphics.setFont(font2)
love.graphics.rectangle("fill",300,300,220,70)
love.graphics.setColor(0,0,0)
love.graphics.print("restart",330,315)
love.graphics.setFont(font)
love.graphics.setColor(1,1,1)
love.graphics.print("Game Over",285,100)
end
function Scene:mousepressed(x,y,button,istouch) 
  if button == 1 then
     if x >= 300 and x < 300 +220 and y >= 300 and y <= 300 +70 then 
       colors_score = 7
  
  Score = 0
      changeScene("battle")
end
end
end
return Scene