local Scene = {}

function Scene:load()
 itchio = love.graphics.newImage("Assets/Sprites/itchio.png")
 youtube = love.graphics.newImage("Assets/Sprites/youtube.png")
 reddit = love.graphics.newImage("Assets/Sprites/reddit.png")
 font = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",50)
 font2 = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",40)
 font3 = love.graphics.newFont("Assets/Fonts/upheavtt.ttf",30)
 
 music = love.audio.newSource("Assets/Musics/02. Main.mp3","stream")
 sound = love.audio.newSource("Assets/Sounds/touch.wav","stream")
 love.audio.play(music)
end
function Scene:update(dt)
  music:setLooping(true)
  music:setVolume(0.3)
end
function Scene:draw()
  
   
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(font)
  love.graphics.print("Defender of Colours",230,30)
  love.graphics.setFont(font2)
  
  --play button
  love.graphics.rectangle("fill",80,150,160,70)
  love.graphics.setColor(0,0,0)
  love.graphics.print("play",110,163)
  --play button
  love.graphics.setColor(1,1,1)
  --exit button
  love.graphics.rectangle("fill",80,300,160,70)
  love.graphics.setColor(0,0,0)
  love.graphics.print("exit",115,315)
  --exit button
  love.graphics.setColor(1,1,1)
  love.graphics.setFont(font3)
  love.graphics.print("Musics:",450,150)
  love.graphics.print("Stone Story RPG",380,180)
  love.graphics.print("1. Main",445,215) 
  love.graphics.print("2.Cross Deadwood River",330,260)
  love.graphics.print("Sounds:",450,370)
  love.graphics.print("made in Bfxr",405,400)
  
  love.graphics.print("my social networks:",310,560)
  love.graphics.draw(itchio,760,560)
  love.graphics.draw(youtube,705,560)
  love.graphics.draw(reddit,650,560)
 
  
end
function Scene:mousepressed(x,y,button,istouch) 
  if button == 1 then
     if x >= 760 and x < 760 +32 and y >= 560 and y <= 560 +32 then 
       love.audio.play(sound)
      love.system.openURL("https://mann-mit-brille.itch.io/")
    
  end
     if x >= 705 and x < 705 +32 and y >= 560 and y <= 560 +32 then 
       love.audio.play(sound)
      love.system.openURL("https://www.youtube.com/channel/UCNGd0NgjsOvo_8TC10JLq3w")
    
  end
  if x >= 650 and x < 650 +32 and y >= 560 and y <= 560 +32 then 
    love.audio.play(sound)
      love.system.openURL("https://www.reddit.com/user/Majestic_South1910")
    
  end
  
  
    

    if x >= 80 and x < 80 +160 and y >= 150 and y <= 150 +70 then 
      love.audio.play(sound)
      love.audio.stop(music)
      TM.load("slide-in")
      changeScene("script")
  end
   if x >= 80 and x < 80 +160 and y >= 300 and y <= 300 +70 then
     love.audio.play(sound)
     
     love.event.wait(0.1)
      love.event.quit()
      
    
    end
  end
end
return Scene