module(..., package.seeall)

function new()
	local localGroup = display.newGroup()
	--> This is how we start every single file or "screen" in our folder, except for main.lua
	-- and director.lua
	--> director.lua is NEVER modified, while only one line in main.lua changes, described in that file
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	
	local background = display.newImage ("splashScreen.png")
	localGroup:insert(background)
	
	local backBtnRelease = function( event )
		print("menuScreen")
		director:changeScene ("menuscreen")
	end
	
	backBtn = ui.newButton{
		default = "redBtn.png",
		over = "pressedRedBtn.png",
		onRelease = backBtnRelease,
		text = "Menu",
		id = "backBtn"
		--emboss = true
	}
	
	backBtn.x = display.contentWidth/2; backBtn.y = 320
	
	localGroup:insert(backBtn)
	
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end