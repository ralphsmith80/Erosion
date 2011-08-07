require ("Screen")
local ui = require("ui")

MenuScreen = Screen:new("menuScreen")



--local imageGroup = display.newGroup()
local background
local newGameBtn
local playBtn
local howToBtn
local highScoreBtn
local state

local newGameBtnPress = function( event )
	--print("pressed newGameBtn")
end

local newGameBtnRelease = function( event )
	--print("released newGameBtn")
	state = "gameScreen"
end

local playBtnRelease = function( event )
	state = "gameScreen"
end

local howToBtnRelease = function( event )
	print("how to")
--	state = "howToScreen"
end

local highScoreBtnRelease = function( event )
	print("high score")
--	state = "highScoreScreen"
end


function MenuScreen:init ()
	--print("init menu screen")
	background = display.newImage("menuBackground.png")
	--imageGroup:insert (splashImage)
--[[	newGameBtn = ui.newButton{
		default = "newGameBtn.png",
		over = "quitGameBtn.png",
		onPress = newGameBtnPress,
		onRelease = newGameBtnRelease,
		id = "newGameBtn"
		--emboss = true
	}
]]
	playBtn = ui.newButton{
		default = "newGameBtn.png",
		over = "quitGameBtn.png",
		--onPress = newGameBtnPress,
		onRelease = playBtnRelease,
		id = "playBtn"
		--emboss = true
	}
	howToBtn = ui.newButton{
		default = "newGameBtn.png",
		over = "quitGameBtn.png",
		--onPress = newGameBtnPress,
		onRelease = howToBtnRelease,
		id = "howToBtn"
		--emboss = true
	}
	highScoreBtn = ui.newButton{
		default = "newGameBtn.png",
		over = "quitGameBtn.png",
		--onPress = newGameBtnPress,
		onRelease = highScoreBtnRelease,
		id = "highScoreBtn"
		--emboss = true
	}
--	newGameBtn.x = 160; newGameBtn.y=240
	playBtn.x = 200; playBtn.y = 240
	howToBtn.x = 100; howToBtn.y = 300
	highScoreBtn.x = 200; highScoreBtn.y = 360
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
	--newGameBtn.parent:remove( newGameBtn )
	playBtn.parent:remove( playBtn )
	howToBtn.parent:remove( howToBtn )
	highScoreBtn.parent:remove( highScoreBtn )
end

