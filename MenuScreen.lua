require ("Screen")
local ui = require("ui")

MenuScreen = Screen:new("menuScreen")



--local imageGroup = display.newGroup()
local background
local playBtn
local howToBtn
local highScoreBtn
local state

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
	--background = display.newImage("menuBackground.png")
	
	background = display.newImage("erosion_title_image_02@2x.png", 40, 80)	
	
	--imageGroup:insert (splashImage)
	playBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		--onPress = newGameBtnPress,
		onRelease = playBtnRelease,
		text = "Play Game",
		id = "playBtn"
		--emboss = true
	}
	howToBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		--onPress = newGameBtnPress,
		onRelease = howToBtnRelease,
		text = "How-To",
		id = "howToBtn"
		--emboss = true
	}
	highScoreBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		--onPress = newGameBtnPress,
		onRelease = highScoreBtnRelease,
		text = "High Scores",
		id = "highScoreBtn"
		--emboss = true
	}

	playBtn.x = 240; playBtn.y = 220
	howToBtn.x = 80; howToBtn.y = 300
	highScoreBtn.x = 240; highScoreBtn.y = 380
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
	playBtn.parent:remove( playBtn )
	howToBtn.parent:remove( howToBtn )
	highScoreBtn.parent:remove( highScoreBtn )
end

