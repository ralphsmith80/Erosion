require ("Screen")

MenuScreen = Screen:new("menuScreen")

--local imageGroup = display.newGroup()
local background

function MenuScreen:init ()
	--print("init menu screen")
	background = display.newImage("menuBackground.png")
	--imageGroup:insert (splashImage)
end

function MenuScreen:updateInput (event)
	--print("update input menu screen")
	--print("event " .. event.name)
	if event.name == "tap" then
		self.state = "gameScreen"
	end
end

function MenuScreen:update ()
	--print("update menu screen")
end

function MenuScreen:draw ()
	--print("draw menu screen")
end

function MenuScreen:exit ()
	--print("exit menu screen")
	background.parent:remove (background)
end
