require ("Screen")
local ui = require("ui")

MenuScreen = Screen:new("menuScreen")



--local imageGroup = display.newGroup()
local background
local newGameBtn
local state

local newGameBtnPress = function( event )
	--print("pressed newGameBtn")
end

local newGameBtnRelease = function( event )
	--print("released newGameBtn")
	state = "gameScreen"
end




function MenuScreen:init ()
	--print("init menu screen")
	background = display.newImage("menuBackground.png")
	--imageGroup:insert (splashImage)
	newGameBtn = ui.newButton{
		default = "newGameBtn.png",
		over = "quitGameBtn.png",
		onPress = newGameBtnPress,
		onRelease = newGameBtnRelease,
		id = "newGameBtn"
		--emboss = true
	}
	newGameBtn.x = 160; newGameBtn.y=240	
	state = self.state
end

function MenuScreen:updateInput (event)
	--print("update input menu screen")
	--print("event " .. event.name)
	if event.name == "tap" then
		--self.state = "gameScreen"
	end
end

function MenuScreen:update ()
	--print("update menu screen")
	self.state = state
end

function MenuScreen:draw ()
	--print("draw menu screen")
end

function MenuScreen:exit ()
	--print("exit menu screen")
	background.parent:remove( background )
	newGameBtn.parent:remove( newGameBtn )
end

