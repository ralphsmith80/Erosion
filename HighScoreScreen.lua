module(..., package.seeall)

--local highScoreTable = { RAD=123456789, BAD=123456788, DUDE=1234 }
local highScoreTable = { [123456789]="RAD", [123456788]="BAD", [1234]="DUDE" }

function new()
	local localGroup = display.newGroup()
	--> This is how we start every single file or "screen" in our folder, except for main.lua
	-- and director.lua
	--> director.lua is NEVER modified, while only one line in main.lua changes, described in that file
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	
	--import the scrolling classes
	local scrollView = require("scrollView")
	local svUtil = require("scrollViewUtil")

	--set the background image
	local background = display.newImage ("splashScreen.png")
	localGroup:insert(background)
	
	-- Setup a scrollable content group
	local topBoundary = display.screenOriginY
	local bottomBoundary = display.screenOriginY
	local scrollView = scrollView.new{ top=topBoundary, bottom=bottomBoundary }
	
	local headingText = display.newText("High Scores", 0, 0, native.systemFontBold, 16)
	headingText:setTextColor(255, 255, 255)
	headingText.x = math.floor(display.contentWidth*0.5)
	headingText.y = 48
	scrollView:insert(headingText)
	
	-- add some text to the scrolling screen
--[[	local howToText = "1. RAD 12345677"
	
	local howToTextObject = svUtil.wrappedText( howToText, 39, 14, native.systemFont) --, {0,0,0} )
	scrollView:insert(howToTextObject)
	howToTextObject.x = 24
	howToTextObject.y = math.floor(headingText.y + headingText.height)
	
	
	local more = display.newText("2. BAD 12345611", 0, 14, native.systemFont)
	more:setTextColor(255, 255, 255)
	print(more.x)
	more.x = more.x + 24
	more.y = math.floor(howToTextObject.y + howToTextObject.height)
	scrollView:insert(more)
	
	local i = display.newImage("newGameBtn.png")
	i.x = 100
	i.y = 200
	scrollView:insert(i)
]]
--[[	i=1
	j=70
	for k,v in pairs(highScoreTable) do
		local yPos = j
		local number = i
		local name = k
		local score = v
		local txt = display.newText( i .. " " .. k .. " " .. v, 0, 14, native.systemFont)
		txt.x = txt.x + 24
		txt.y = j
		j = j + 20
		i = i + 1
		scrollView:insert(txt)
	end
]]	
	t = {}
	for k,v in pairs(highScoreTable) do table.insert(t, k) end
	table.sort(t, function(a,b) return a>b end)
	i=1
	j=70
	for i,n in ipairs(t) do 
		print(n)
		print(highScoreTable[n])
		local yPos = j
		local number = i
		local name = highScoreTable[n]
		local score = n
		local txt = display.newText( i .. " " .. name .. " " .. score, 0, 14, native.systemFont)
		txt.x = txt.x + 24
		txt.y = j
		j = j + 20
		i = i + 1
		scrollView:insert(txt)
	end
		
	-- Make the scrollView equal to the height of the screen if it's not already
	sHeight = scrollView.height
	if sHeight < display.contentHeight then
		sHeight = display.contentHeight
	end

	-- Important! Add a background to the scroll view for a proper hit area
	local scrollBackground = display.newRect(0, 0, display.contentWidth, sHeight)
	--scrollBackground:setFillColor(255, 255, 255)
	scrollBackground:setFillColor(0, 0, 0, 150)
	scrollView:insert(1, scrollBackground)
	
	scrollView:addScrollBar()
	
	--localGroup:insert(scrollBackground)
	localGroup:insert(scrollView)
	
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
	
	backBtn.x = display.contentWidth/2; backBtn.y = 440
	
	localGroup:insert(backBtn)
	
------------------------------------------------------------------------------
------------------------------------------------------------------------------
	return localGroup
end