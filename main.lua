require("ScreenManager")
require("splashScreen")
require("gameScreen")

display.setStatusBar( display.HiddenStatusBar )
 
sm = ScreenManager:new(gameScreen)
sm:init()


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
	
	name = sm:getScreen():getName()
	print("new screen name " .. name)
]]
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
	sm:draw()
end


Runtime:addEventListener("tap", tap);
Runtime:addEventListener("touch", touch);

--fires every frame interval
Runtime:addEventListener("enterFrame", draw);