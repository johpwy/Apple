local composer = require( "composer" )


local scene=composer.newScene()
---------------------------------------
local centerX = display.contentCenterX
local centerY = display.contentCenterY
local tPrevious = system.getTimer()
local backgroundGroup1 = display.newGroup()
local buttonGrounp = display.newGroup()

---------------------------------------
function scene:create( event )
 local sceneGroup = self.view

 local bg = display.newImageRect( "images/lod/bglo-01.png", 322, 476 )
 local logo = display.newImageRect( "images/lod/corcle.png", 234, 200)
       bg.anchorX = 0
       bg.x = 0
       bg.y = centerY
       logo.anchorX = 0
       logo.x = 40
       logo.y = 180



       backgroundGroup1:insert(display.newGroup(bg,logo))
       sceneGroup:insert(backgroundGroup1)

  -------dog

  local saturnSheet = graphics.newImageSheet( "images/lod/doglo-01.png", sheetInfo:getSheet() )
    local SaturnOptions = {
    
        name = "doglo",
        sheet = saturnSheet,
        start = sheetInfo:getFrameIndex("doglo1"),
        count = 2,   --張數
        time = 3000, --轉換時間,1000＝１秒
        loopCount=0
    }

    local Saturn = display.newSprite( saturnSheet, SaturnOptions)
    Saturn.x=centerX*0.7
    Saturn.y=centerY*0.4
    Saturn.xScale = 0.5 --Ｘ軸縮放比例
    Saturn.yScale = 0.5 --Ｙ軸縮放比例
    Saturn:play()
    
    sceneGroup:insert(doglo)


 

 
end
 
function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  
 if phase == "will" then

  composer.loadScene('game')

 elseif phase == "did" then

  timer.performWithDelay(3000, function()
            composer.gotoScene('game')
        end)
  
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

 print("destroy_loading")
  
end

 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene