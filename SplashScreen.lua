require ("Screen")

SplashScreen = Screen:new("splashScreen")

local time = 0
local splashImage

function SplashScreen:init ()
	--print("init splash screen")
	splashImage = display.newImage("splashScreen.png")
	time = system.getTimer()
	print(time)
end

function SplashScreen:updateInput (event)
	--print("update input splash screen")
end

function SplashScreen:update ()
	--print("update splash screen")
	local splashDelay = system.getTimer() - time
	if splashDelay > 3000 then --3 second splash screen
		print("switch state")
		self.state = "menuScreen"
	end
end

function SplashScreen:draw ()
	--print("draw splash screen")
end

function SplashScreen:exit ()
	--print("exit splash screen")
	splashImage.parent:remove (splashImage)
end
