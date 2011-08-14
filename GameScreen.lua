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
	
	local function update (event)
		if event.phase == "ended" then
			local circle = display.newCircle(event.x, event.y, 30)
			--circle.alpha = 0.5
			circle:setFillColor(255, 0, 0, 150)
			localGroup:insert(circle)
		end
	end

	background:addEventListener ("touch", update)
	--> This adds the touch event to the background

------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end