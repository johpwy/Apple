local composer = require( "composer" )
local widget = require("widget")

local scene=composer.newScene()
---------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local tPrevious = system.getTimer()
local backgroundGroup = display.newGroup()
local buttonGrounp = display.newGroup()
local animalGrounp = display.newGroup()
local musie


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


  ----------animai------

  
  local animai02 = display.newImageRect( "images/01/menu05.png", 139, 139 )
  local animai03 = display.newImageRect( "images/01/menu06.png", 139, 139 )
  local animai01 = display.newImageRect( "images/01/menu07.png", 150 , 150)
        animai01.anchorX = 0
        animai01.x = 95
        animai01.y = 410
        animai02.anchorX = 0
        animai02.x = 0
        animai02.y = 410
        animai03.anchorX = 0
        animai03.x = 200
        animai03.y = 410




  animalGrounp:insert(display.newGroup(animai01,animai02,animai03))
  sceneGroup:insert(animalGrounp)






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
   play.y = 250


  

   buttonGrounp:insert(display.newGroup(play))
   sceneGroup:insert(buttonGrounp)


   soundTrack = audio.loadStream("sounds/op.mp3")
   




end
 
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  
 if phase == "will" then
  -- Called when the scene is still off screen and is about to move on screen
 elseif phase == "did" then
  -- Called when the scene is now on screen
 timer.performWithDelay( 10, function()
  audio.play( soundTrack, { channel = 2, loops=-1, fadein=1000 }  )
  end)
 
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
 
   audio.dispose( soundTrack )


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