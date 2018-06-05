local composer = require( "composer" )
local scene = composer.newScene()
 
---------------------------------------------------------------------------------
local play555 = display.newGroup()


 --設定畫面中央Ｘ與Ｙ的座標
local centerX = display.contentCenterX
local centerY = display.contentCenterY

--定義計時器
--local tPrevious = system.getTimer()
--導入background圖片
function scene:create( event )
 local sceneGroup = self.view

 local bg = display.newImageRect( "images/PNG/01/menu-01.jpg", 322, 476 )
 bg.anchorX = 0 --設定錨點
 bg.x = 0 --Ｘ座標
 bg.y = centerY--Ｙ座標
 bg.speed = 1 --新增速度

 local logo = display.newImageRect( "images/PNG/01/menu04-01.png", 250, 234 )
 logo.anchorX = 0
 logo.x=30
 logo.y=110

 local widget = require("widget")

 local play = widget.newButton{
 width=140,
 height=58,
 id="1",
 defaultFile="images/PNG/01/menuP.png",
 overFile="images/PNG/01/menuP1.png",

  }
  play.anchorX = 0
  play.x=95
  play.y=230

 end
end



--local widget = require("widget")





--動畫--



function scene:show( event )
 local sceneGroup = self.view
 local phase = event.phase
  
 if phase == "will" then
  -- Called when the scene is still off screen and is about to move on screen
  Runtime:removeEventListener("enterFrame",move)
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
  Runtime:removeEventListener("enterFrame",move)
 elseif( phase == "did" )then
  -- Called when the scene is now off screen
 end
end
 
 
function scene:destroy( event )
 local sceneGroup = self.view
 print("destroy_main") 
 
end
 
---------------------------------------------------------------------------------
 
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 
---------------------------------------------------------------------------------
 
return scene