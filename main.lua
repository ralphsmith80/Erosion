require("ScreenManager")
require("SplashScreen")
require("MenuScreen")
require("GameScreen")

display.setStatusBar( display.HiddenStatusBar )

ss = SplashScreen:new("splashScreen")
ms = MenuScreen:new("menuScreen")
gs = GameScreen:new("gameScreen")
print("-- Screen Names --")
print(ss.name)
print(ms.name)
print(gs.name)
print()
sm = ScreenManager:new()
sm:addScreen(ss)
sm:addScreen(ms)
sm:addScreen(gs)
sm:init()

sm:setActiveScreen("splashScreen")
--[[print("active screen")
print(sm.screens["splashScreen"].name)
print(sm.screen.name)
print(sm:getScreen().name)
]]

local function tap(event)
	sm:updateInput(event)

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