module(..., package.seeall)

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
	
	local headingText = display.newText("How To Play", 0, 0, native.systemFontBold, 16)
	headingText:setTextColor(255, 255, 255)
	headingText.x = math.floor(display.contentWidth*0.5)
	headingText.y = 48
	scrollView:insert(headingText)
	
	-- add some text to the scrolling screen
	local howToText = "Hold your finger on the screen to create and erosion. Extra BS ... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet consectetur euismod. Phasellus non ipsum vel eros vestibulum consequat. Integer convallis quam id urna tristique eu viverra risus eleifend.\n\nAenean suscipit placerat venenatis. Pellentesque faucibus venenatis eleifend. Nam lorem felis, rhoncus vel rutrum quis, tincidunt in sapien. Proin eu elit tortor. Nam ut mauris pellentesque justo vulputate convallis eu vitae metus. Praesent mauris eros, hendrerit ac convallis vel, cursus quis sem. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, dui in vehicula dapibus, lorem nisi placerat turpis, quis gravida elit lectus eget nibh. Mauris molestie auctor facilisis.\n\nCurabitur lorem mi, molestie eget tincidunt quis, blandit a libero. Cras a lorem sed purus gravida rhoncus. Cras vel risus dolor, at accumsan nisi. Morbi sit amet sem purus, ut tempor mauris. "
	
	local howToTextObject = svUtil.wrappedText( howToText, 39, 14, native.systemFont) --, {0,0,0} )
	scrollView:insert(howToTextObject)
	howToTextObject.x = 24
	howToTextObject.y = math.floor(headingText.y + headingText.height)
	
	-- Important! Add a background to the scroll view for a proper hit area
	local scrollBackground = display.newRect(0, 0, display.contentWidth, scrollView.height+64)
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