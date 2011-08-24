module(..., package.seeall)

function new()
	local localGroup = display.newGroup()
	--> This is how we start every single file or "screen" in our folder, except for main.lua
	-- and director.lua
	--> director.lua is NEVER modified, while only one line in main.lua changes, described in that file
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	local halfW = display.contentCenterX
 	local halfH = display.contentCenterY
	
	local background = display.newImage ("paper_bkg.png", true)
	background.x = halfW
	background.y = halfH
	localGroup:insert(background)
	
	local gridImage = display.newImage( "grid.png", true )
	
	gridImage.alpha = 0.7
    
    
    local maskScale = 0.25
	
    mask = graphics.newMask( "circlemask.png" )
	gridImage.maskScaleX = maskScale
	gridImage.maskScaleY = maskScale
	gridImage:setMask( mask )
	localGroup:insert(gridImage)
	
	
	print("viewable w: " .. display.viewableContentWidth)
	print("viewable h: " .. display.viewableContentHeight)
	print("w: " .. display.contentWidth)
	print("h: " .. display.contentHeight)
	
	
	local function growMask(event)
		
		print(event.name .. " occurred")
		
		print("MASK scaleX: " .. gridImage.maskScaleX)
		print("MASK scaleY: " .. gridImage.maskScaleY)
		
		gridImage.maskScaleX = gridImage.maskScaleX + 0.02
		gridImage.maskScaleY = gridImage.maskScaleY + 0.02
		
	end
	
	local function update (event)


		-- Determine a way to add many masks or something similar (potentially
		-- a hardware limitation based on the phone (only 2 masks on some devices
		-- and 8 on iphone 3g))
		
		--local circle = display.newCircle(event.x, event.y, 30)
			--circle.alpha = 0.5
		--circle:setFillColor(255, 0, 0, 150)
		--localGroup:insert(circle)
			
			
		local t = event.target
		local phase = event.phase

		if phase == "began" then
			
			display.getCurrentStage():setFocus( t )

			t.maskScaleX = maskScale
			t.maskScaleY = maskScale
		
			-- Spurious events can be sent to the target, e.g. the user presses 
			-- elsewhere on the screen and then moves the finger over the target.
			-- To prevent this, we add this flag. Only when it's true will "move"
			-- events be sent to the target.
			t.isFocus = true
		
			-- Store initial position
			t.x0 = event.x - t.maskX
			t.y0 = event.y - t.maskY
				
			print("")
			print("BEGIN *******************")
			print("event.x: " .. event.x)
			print("event.y: " .. event.y)
			
			print("t.maskX: " .. t.maskX)
			print("t.maskY: " .. t.maskY)
			
			print("t.x0: " .. t.x0)
			print("t.y0: " .. t.y0)
			print("*************************")
			print("")			

			--local rotation = math.deg( math.atan2( t.maskY, t.maskX ) )
			--t.maskRotation = rotation	
							
			Runtime:addEventListener("enterFrame", growMask)			
								
								
		elseif t.isFocus then
			if "ended" == phase then
				localGroup:insert(gridImage)
				
				Runtime:removeEventListener("enterFrame", growMask)
					
					-- Make object move (we subtract t.x0,t.y0 so that moves are
					-- relative to initial grab point, rather than object "snapping").
					--t.maskX = event.x - t.x0
					--t.maskY = event.y - t.y0
					
			t.maskX = event.x - (display.contentWidth) - (maskScale*200) - 15
			t.maskY = event.y - (display.contentHeight) - (maskScale*200/2) - 10
					
					--t.maskScaleX = t.maskScaleX + 0.01
					--t.maskScaleY = t.maskScaleY + 0.01
					
					
					print("")
				print("ENDED *******************")
				print("event.x: " .. event.x)
				print("event.y: " .. event.y)
				
				print("t.maskX: " .. t.maskX)
				print("t.maskY: " .. t.maskY)
				
				print("t.x0: " .. t.x0)
				print("t.y0: " .. t.y0)
				print("*************************")
				print("")			
							
					
					
					
				elseif "ended" == phase or "cancelled" == phase then
					display.getCurrentStage():setFocus( nil )
					t.isFocus = false
				end
			end
		
			--return true

			
			
		--end
	end

	

	--background:addEventListener ("touch", update)
	gridImage:addEventListener ("touch", update)
	--> This adds the touch event to the background

------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end