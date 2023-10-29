math.randomseed(os.time())
local Scene = {}
function Scene:load()
  font2 = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",40)
  music = love.audio.newSource("Assets/Musics/15. Cross Deadwood River.mp3","stream")
  walk = love.audio.newSource("Assets/Sounds/walk.wav","stream")
  shoot = love.audio.newSource("Assets/Sounds/shoot.wav","stream")
  
  colors = {}
  
  
  colors.redcl = {}
  colors.redcl.img = love.graphics.newImage("Assets/Sprites/red.png")
  colors.redcl.x = 45 
  colors.redcl.y = 305 
  colors.redcl.width = 19
  colors.redcl.height = 19
  
  
  
 
  
  
  
  
  colors.orangecl = {}
  colors.orangecl.img = love.graphics.newImage("Assets/Sprites/orange.png")
  colors.orangecl.x = 135 
  colors.orangecl.y = 305 
  colors.orangecl.width = 19
  colors.orangecl.height = 19
  
 
  colors.yellowcl = {}
  colors.yellowcl.img = love.graphics.newImage("Assets/Sprites/yellow.png")
  colors.yellowcl.x = 255
  colors.yellowcl.y = 305 
  colors.yellowcl.width = 19
  colors.yellowcl.height = 19
  
  colors.greencl = {}
  colors.greencl.img = love.graphics.newImage("Assets/Sprites/green.png")
  colors.greencl.x = 375
  colors.greencl.y = 305 
  colors.greencl.width = 19
  colors.greencl.height = 19
  
  colors.blaucl = {}
  colors.blaucl.img = love.graphics.newImage("Assets/Sprites/blau.png")
  colors.blaucl.x = 495
  colors.blaucl.y = 305 
  colors.blaucl.width = 19
  colors.blaucl.height = 19
  
  colors.blau2cl = {}
  colors.blau2cl.img = love.graphics.newImage("Assets/Sprites/blau2.png")
  colors.blau2cl.x = 615
  colors.blau2cl.y = 305 
  colors.blau2cl.width = 19
  colors.blau2cl.height = 19
  
  
  colors.lilacl = {}
  colors.lilacl.img = love.graphics.newImage("Assets/Sprites/lila.png")
  colors.lilacl.x = 736
  colors.lilacl.y = 305 
  colors.lilacl.width = 19
  colors.lilacl.height = 19
  
  
 



enemy = {}
enemies_controller = {}
enemies_controller.enemies = {}
function enemies_controller:spawnEnemy(x,y)
  enemy = {}
  enemy.x = x
  enemy.y = y
  enemy.width = 30
  enemy.height = 30
  enemy.speed = 1
  enemy.cooldown = 30 
  table.insert(self.enemies,enemy)
end
enemy2 = {}
enemies_controller2 = {}
enemies_controller2.enemies2 = {}

function enemies_controller2:spawnEnemy(x,y)
  enemy2 = {}
  enemy2.x = x
  enemy2.y = y
  enemy2.width = 30
  enemy2.height = 30
  enemy2.speed = 1
  enemy2.cooldown = 20 
  table.insert(self.enemies2,enemy2)
  end
  
  player = {}
  player.x = 370
  player.y = 240
  player.width = 30
  player.heigth = 30
  player.speed = 20
  player.bulletsup = {}
  player.bulletsdown = {}
  player.cooldown = 60
  player.cooldown2 = 40
  
 
  
   player.fire = function()
    if player.cooldown <= 0 then
      love.audio.play(shoot)
      player.cooldown = player.cooldown2
      bullet = {}
      bullet.x = player.x + 10
      bullet.y = player.y
      bullet.width = 10
      bullet.height = 10
      table.insert(player.bulletsup, bullet)
      
    end
  end
  
   player.fire2 = function()
     
    if player.cooldown <= 0 then
      love.audio.play(shoot)
      player.cooldown = player.cooldown2
      bullet = {}
      bullet.x = player.x +10
      bullet.y = player.y
      bullet.width = 10
      bullet.height = 10
      table.insert(player.bulletsdown, bullet)
      
      
    end
  end
  enemies_controller:spawnEnemy(40,-30)
  enemies_controller:spawnEnemy(130,-30)
  enemies_controller:spawnEnemy(250,-30)
  enemies_controller:spawnEnemy(370,-30)
  enemies_controller:spawnEnemy(490,-30)
  enemies_controller:spawnEnemy(610,-30)
  enemies_controller:spawnEnemy(735,-30)
  
  enemies_controller2:spawnEnemy(40,600)
  enemies_controller2:spawnEnemy(130,600)
  enemies_controller2:spawnEnemy(250,600)
  enemies_controller2:spawnEnemy(370,600)
  enemies_controller2:spawnEnemy(490,600)
  enemies_controller2:spawnEnemy(610,600)
  enemies_controller2:spawnEnemy(735,600)
  
  
  love.audio.play(music)
end
function Scene:update(dt)
  
  if colors_score == 0 then
    changeScene("game over")
    love.audio.stop(music)
  end
  
  music:setLooping(true)
  music:setVolume(0.2)
  
  checkCollisions(enemies_controller.enemies,player.bulletsup)
  checkCollisions2(enemies_controller2.enemies2,player.bulletsdown)
  checkCollisions3(enemies_controller.enemies,colors)
  
  checkCollisions4(enemies_controller2.enemies2,colors)
    
  
  
  
   
    
   walk:setVolume(0.1)
  player.cooldown = player.cooldown - 1
  
  if player.y < 0 then
    player.y = 0
  elseif player.y > 570 then
    player.y = 570
  elseif player.x < 10 then
    player.x = 10
  elseif player.x > 760 then
    player.x = 760
  end
   
    for i,b in ipairs(player.bulletsup) do
    if b.y < -10 then
      table.remove(player.bulletsup, i)
    end
    
    b.y = b.y - 10
  end
  
  for i,b in ipairs(player.bulletsdown) do
    if b.y >  600 then
      table.remove(player.bulletsdown, i)
    end
    b.y = b.y + 10
  end 
  
  
  for _,e in pairs(enemies_controller.enemies) do
   e.y = e.y + 10 * dt
  end
   for _,e in pairs(enemies_controller2.enemies2) do
   e.y = e.y - 10 * dt
  end
end
function Scene:draw()
  love.graphics.setFont(font2)
  love.graphics.print("Score "..Score,15,7)
  
  for _,e in pairs (enemies_controller.enemies) do
    love.graphics.rectangle("fill",e.x,e.y,e.width,e.height)
  end
  
  for _,e in pairs (enemies_controller2.enemies2) do
    love.graphics.rectangle("fill",e.x,e.y,e.width,e.height)
  end
  
  love.graphics.rectangle("fill",790,0,50,800)
  love.graphics.rectangle("fill",-40,0,50,800)
  love.graphics.rectangle("fill",0,-40,800,50)
  love.graphics.rectangle("fill",0,590,800,50)
  
 love.graphics.rectangle("fill",player.x,player.y,player.width,player.heigth)
 
 for _,b in pairs(player.bulletsup) do
    love.graphics.rectangle("fill", b.x, b.y, 10, 10)
  end
  for _,b in pairs(player.bulletsdown) do
    love.graphics.rectangle("fill", b.x, b.y, 10, 10)
  end
  love.graphics.draw(colors.redcl.img,colors.redcl.x,colors.redcl.y)
  love.graphics.draw(colors.orangecl.img,colors.orangecl.x,colors.orangecl.y)
  love.graphics.draw(colors.yellowcl.img,colors.yellowcl.x,colors.yellowcl.y)
  love.graphics.draw(colors.greencl.img,colors.greencl.x,colors.greencl.y)
  love.graphics.draw(colors.blaucl.img,colors.blaucl.x,colors.blaucl.y)
  love.graphics.draw(colors.blau2cl.img,colors.blau2cl.x,colors.blau2cl.y)
  love.graphics.draw(colors.lilacl.img,colors.lilacl.x,colors.lilacl.y)
  
   
  
end
function Scene:keypressed(key,scancode,isrepeat)
  if key == "w" then
     player.y = player.y - 30
     love.audio.play(walk)
   elseif key == "s" then
     love.audio.play(walk)
     player.y = player.y + 30
   elseif key == "a" then
     love.audio.play(walk)
     player.x = player.x - 30
   elseif key == "d" then
     love.audio.play(walk)
     player.x = player.x + 30
  end
  if key == "up" then
     player.fire()
  end
  if key == "down" then
     player.fire2()
  end
end
return Scene