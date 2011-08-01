require ("Screen")
require("Circle")

local circle = Circle:new(100, 100, 30)
--circle:show()

gameScreen = Screen:new("gameScreen")

function gameScreen:init ()
	--print("init game screen")
end


function gameScreen:updateInput (event)
	--print("update input game screen")
	if event.name == "tap" then
		circle = display.newCircle(event.x, event.y, 30)
		--circle:setFillColor(255, 0, 0, 175)
		circle.alpha = 0.5
		--print("alpha " .. circle.alpha)
	end
	print(event.phase)
	--print(event.target)
end

function gameScreen:update ()
	--print("update game screen")
end

function gameScreen:draw ()
	--print("draw splash screen")
end

function gameScreen:exit ()
	--print("exit game screen")
end
