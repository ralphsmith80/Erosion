module(..., package.seeall)

function new()
	local localGroup = display.newGroup()
	--> This is how we start every single file or "screen" in our folder, except for main.lua
	-- and director.lua
	--> director.lua is NEVER modified, while only one line in main.lua changes, described in that file
------------------------------------------------------------------------------
------------------------------------------------------------------------------

	local time = system.getTimer()
	local displayTime = 3000 --3 second splash screen
	local background = display.newImage ("erosion_title_image_02.png", 20, 40)
	localGroup:insert(background)
	--> This sets the background
	
	--> make the splash screen run for the full displayTime
	displayTime = displayTime + time


	local function update (event)
		local splashDelay = system.getTimer() - time
		if splashDelay > displayTime then
			director:changeScene ("MenuScreen", "fade")
			--> Remove runtime events so they do eat up cpu
			Runtime:removeEventListener ("enterFrame", update)
		end
	end

	Runtime:addEventListener ("enterFrame", update)
	--> This adds the function and listener to the timer runtime event

------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end