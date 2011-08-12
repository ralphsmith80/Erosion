require ("Screen")

SplashScreen = Screen:new("splashScreen")

local time = 0
local splashImage
local displayTime = 3000 --3 second splash screen

function SplashScreen:init ()
	--print("init splash screen")
	--splashImage = display.newImage("splashScreen.png")
	
	splashImage = display.newImage("erosion_title_image_02@2x.png", 40, 80)
	
	time = system.getTimer()
	displayTime = displayTime + time
end

function SplashScreen:updateInput (event)
	--print("update input splash screen")
end

function SplashScreen:update ()
	--print("update splash screen")
	local splashDelay = system.getTimer() - time
	if splashDelay > displayTime then
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
