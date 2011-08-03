require("ScreenManager")
require("SplashScreen")
require("MenuScreen")
require("GameScreen")

display.setStatusBar( display.HiddenStatusBar )

ss = SplashScreen:new("splashScreen")
ms = MenuScreen:new("menuScreen")
gs = GameScreen:new("gameScreen")
print("names")
print(gs.name)
print(ss.name)
sm = ScreenManager:new()
sm:addScreen(ss)
sm:addScreen(ms)
sm:addScreen(gs)
sm:init()

sm:setActiveScreen("splashScreen")
print("active screen")
print(sm.screens["splashScreen"].name)
print(sm.screen.name)
print(sm:getScreen().name)


local function tap(event)
	sm:updateInput(event)

	--test switching scenes
--[[	s = sm:getScreen()
	print("current screen " .. s:getName())
	if s:getName() == "splashScreen" then
		sm:setScreen(gameScreen)
	elseif s:getName() == "gameScreen" then
		sm:setScreen(splashScreen)
	else
		print("screen doesn't equal test values")
	end
]]	
	name = sm:getScreen():getName()
	print("screen name " .. name)

end


local function touch(event)
	--print("touch time " .. event.time)
	sm:updateInput(event)
end


--system.getTimer()
local function draw(event)
	-- Seconds since app started = event.time/1000
	--print("system " .. system.getTimer())
	--print("event " .. event.time)
	print("num objects " .. display.getCurrentStage().numChildren)
	sm:update()
	sm:draw()
end


Runtime:addEventListener("tap", tap);
Runtime:addEventListener("touch", touch);

--fires every frame interval
Runtime:addEventListener("enterFrame", draw);