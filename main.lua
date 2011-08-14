require ("Util")

--> Imports director
local director = require ("director")

--> Creates a main group
local mainGroup = display.newGroup()

local function runMain()
	Util.printProgramIntro()
	
	Util.functionDebug(Util.mainDebug, "----- [Begin] runMain -----")
	display.setStatusBar( display.HiddenStatusBar )
	
	--> Add the group from director
	mainGroup:insert(director.directorView)
	
	--> Change the scene, no effects
	director:changeScene("SplashScreen")

	Util.functionDebug(Util.mainDebug, "----- [End] runMain -----")
end

-- Execution
runMain()



