require ("Screen")
require("Circle")

local circle = Circle:new(100, 100, 30)
--circle:show()

GameScreen = Screen:new("gameScreen")

function GameScreen:init ()
	print("init game screen")
end

function GameScreen:updateInput (event)
	--print("update input game screen")
	if event.name == "tap" then
		circle = display.newCircle(event.x, event.y, 30)
		--circle:setFillColor(255, 0, 0, 175)
		circle.alpha = 0.5
		--print("alpha " .. circle.alpha)
		--self.state = splashScreen
	end
	print(event.phase)
	--print(event.target)
end

function GameScreen:update ()
	--print("update game screen")
end

function GameScreen:draw ()
	--print("draw splash screen")
end

function GameScreen:exit ()
	--print("exit game screen")
end
