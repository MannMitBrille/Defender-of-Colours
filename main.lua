TM = require "TransitionMgr".newManager()
function love.load()
  TM.setPath("transitions")
  die = false
  TM.load("fade-in")
  changeScene("menu")
  
  colors_score = 7
  
  Score = 0

end
function love.update(dt)
  TM.update(dt)
   if Scene.update then Scene:update(dt) end
end
function love.draw()
  TM.draw()
  if Scene.draw then Scene:draw() end
end
function changeScene(nextScene)
  Scene = require(nextScene)
  if Scene.load then Scene:load() end
end
function love.mousepressed(x,y,button,istouch) 
  if Scene.mousepressed then Scene:mousepressed(x,y,button,istouch)end
end
function love.keypressed(key,scancode,isrepeat)
  if Scene.keypressed then  Scene:keypressed(key,scancode,isrepeat)end
end
function checkCollisions(enemies, bullets)
  for i, e in ipairs(enemies) do
    for _, b in pairs(bullets) do
      if b.y <= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
        table.remove(enemies,i)
        
        table.remove(bullets)
        Score = Score + 1
        enemies_controller:spawnEnemy(e.x,-30)
      end
    end
  end
  
end


  function checkCollisions2(enemies, bullets)
  for i, e in ipairs(enemies) do
    for _, b in pairs(bullets) do
      if b.y >= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
        table.remove(enemies,i)
        
        table.remove(bullets)
        Score = Score + 1
        enemies_controller2:spawnEnemy(e.x,600)
      end
    end
  end
  

end

function checkCollisions3(enemies, bullets)
  for i, e in ipairs(enemies) do
    for _, b in pairs(bullets) do
      if b.y <= e.y + e.height and b.x > e.x and b.x < e.x + e.width then
        table.remove(enemies,i)
        b.x = 1000
        colors_score = colors_score - 1
        
      end
    end
  end
  

end
function checkCollisions4(enemies, bullets)
  for i, e in ipairs(enemies) do
    for _, b in pairs(bullets) do
      if b.y >= e.y - e.height and b.x > e.x and b.x < e.x + e.width then
        table.remove(enemies,i)
        b.x = 1000
        colors_score = colors_score - 1
        
      end
    end
  end
  

end
