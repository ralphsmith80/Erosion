-- Globals

gameName    = "Erosion"
gameVer     = "0.01"

Util = {
screenDebug = true, 
mainDebug   = true,
inputDebug  = false, 
logicDebug  = false,
drawDebug   = false
}

-- Functions
function Util.functionDebug(booleanTest, debugString)
	if booleanTest then
		print(debugString)
	end
end

function Util.displayEvents(eventType)
	print("############### Event ###############")
	print("type:                    " .. eventType)
	print("content center x:        " .. display.contentCenterX)
	print("content hight:           " .. display.contentHeight)
	print("content scale x:         " .. display.contentScaleX)
	print("screen origin x:         " .. display.screenOriginX)
	print("viewable content height: " .. display.viewableContentHeight)
	print("viewable content width:  " .. display.viewableContentWidth)
	print("#####################################")

end

function Util.printProgramIntro()
	print ("\n\n\n\n$$$$$$$$$$$$$$$$$$$$$$$$$$ PROGRAM START $$$$$$$$$$$$$$$$$$$$$$$$$$")
	print ("Program: " .. gameName)
	print ("Version: " .. gameVer)
	print ("\n\n")
end