require ("ScreenManager")
require ("Util")



-- Function Defines

-- Handle a Tap
local function tap(event)
	ScreenManager.getInstance():updateInput(event)

	Util.displayEvents("Tap")
end

-- Handle a Touch
local function touch(event)
	ScreenManager.getInstance():updateInput(event)
	
	Util.displayEvents("Touch")
end


local function draw(event)
	-- Seconds since app started = event.time/1000
	--print("system " .. system.getTimer())
	--print("event " .. event.time)
--	print("num objects " .. display.getCurrentStage().numChildren)
	
	--sm:update()
	--sm:draw()
	ScreenManager.getInstance():update()
	ScreenManager.getInstance():draw()
end

local function setupEventListeners()
	Runtime:addEventListener("tap", tap);
	Runtime:addEventListener("touch", touch);

	--fires every frame interval
	Runtime:addEventListener("enterFrame", draw);

end


local function createScreenManager()
	sm = ScreenManager:new()
	sm:init()
	sm:setInstance(sm)
end


local function runMain()
	Util.printProgramIntro()
	
	Util.functionDebug(Util.mainDebug, "----- [Begin] runMain -----")
	display.setStatusBar( display.HiddenStatusBar )

	-- Make a ScreenManager
	createScreenManager()
	
	-- Setup Screens
	ScreenManager.getInstance().setupScreens()
	
	-- Setup Event Listeners
	setupEventListeners()

	Util.functionDebug(Util.mainDebug, "----- [End] runMain -----")
end


-- Execution

runMain()



