require ("Screen")

splashScreen = Screen:new("splashScreen")

function splashScreen:init ()
	--print("init splash screen")
	display.newImage("splashScreen.png")
end

function splashScreen:updateInput (event)
	--print("update input splash screen")
end

function splashScreen:update ()
	--print("update splash screen")
end

function splashScreen:draw ()
	--print("draw splash screen")
end

function splashScreen:exit ()
	--print("exit splash screen")
end
