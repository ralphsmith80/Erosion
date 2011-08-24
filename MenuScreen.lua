module(..., package.seeall)

function new()
	local localGroup = display.newGroup()
	--> This is how we start every single file or "screen" in our folder, except for main.lua
	-- and director.lua
	--> director.lua is NEVER modified, while only one line in main.lua changes, described in that file
------------------------------------------------------------------------------
------------------------------------------------------------------------------

	local ui = require("ui")
	local background = display.newImage("erosion_title_image_02.png", 20, 40)
	local state

	local playBtnRelease = function( event )
		print("gameScreen")
		director:changeScene ("GameScreen", "fade")
	end

	local howToBtnRelease = function( event )
		print("how to")
		director:changeScene ("HowToScreen", "fade")
	end

	local highScoreBtnRelease = function( event )
		print("high score")
		director:changeScene ("HighScoreScreen", "fade")
	end	
	
	playBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		onRelease = playBtnRelease,
		text = "Play Game",
		id = "playBtn"
		--emboss = true
	}
	howToBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		onRelease = howToBtnRelease,
		text = "How-To",
		id = "howToBtn"
		--emboss = true
	}
	highScoreBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		onRelease = highScoreBtnRelease,
		text = "High Scores",
		id = "highScoreBtn"
		--emboss = true
	}

--[[	print(display.viewableContentHeight)
	print(display.contentHeight)
	print(display.contentWidth)
]]
	playBtn.x = 240; playBtn.y = 220
	howToBtn.x = 80; howToBtn.y = 300
	highScoreBtn.x = 240; highScoreBtn.y = 380
	
	localGroup:insert(background)
	localGroup:insert(playBtn)
	localGroup:insert(howToBtn)
	localGroup:insert(highScoreBtn)
	
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end
