local composer = require( "composer" )
local widget = require("widget")

local scene=composer.newScene()
---------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local tPrevious = system.getTimer()
local backgroundGroup = display.newGroup()
local buttonGrounp = display.newGroup()

---------------------------------------
-- Function to handle button events
local function handleButtonEvent( event )
 
    if ( "ended" == event.phase ) then
        composer.gotoScene( "game",{effect ="fade",time=400})
    end
end



---------------------------------------------
function scene:create( event )
 local sceneGroup = self.view

 local bg = display.newImageRect( "images/01/menu-01.jpg", 322, 476 )
 local logo = display.newImageRect( "images/01/menu04-01.png", 250, 234 )
       bg.anchorX = 0
       bg.x = 0
       bg.y = centerY
       logo.anchorX = 0
       logo.x = 35
       logo.y = 110



       backgroundGroup:insert(display.newGroup(bg,logo))
       sceneGroup:insert(backgroundGroup)

  ---button



  local play = widget.newButton{
        width = 140,
        height = 58,
        defaultFile = "images/01/menuP.png",
        overFile = "images/01/menuP1.png",
        onEvent = handleButtonEvent

   }
   play.anchorX = 0
   play.x = 95
   play.y = 230


  local quit =  widget.newButton{
        width = 140,
        height = 58,
        defaultFile = "images/01/menuQ.png",
        overFile = "images/01/menuQ1.png",

   }
   quit.anchorX = 0
   quit.x = 95
   quit.y = 300

   buttonGrounp:insert(display.newGroup(play,quit))
   sceneGroup:insert(buttonGrounp)





end
 
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  
 if phase == "will" then
  -- Called when the scene is still off screen and is about to move on screen
 elseif phase == "did" then
  -- Called when the scene is now on screen
  -- 
  -- INSERT code here to make the scene come alive
  -- e.g. start timers, begin animation, play audio, etc.
 end
end
 
function scene:hide( event )
 local sceneGroup = self.view
 local phase = event.phase
  
 if event.phase == "will" then
  -- Called when the scene is on screen and is about to move off screen
  --
  -- INSERT code here to pause the scene
  -- e.g. stop timers, stop animation, unload sounds, etc.)
 elseif phase == "did" then
  -- Called when the scene is now off screen
 end
end
 
 
function scene:destroy( event )
 local sceneGroup = self.view

 print("destroy_menu")
  
 
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene