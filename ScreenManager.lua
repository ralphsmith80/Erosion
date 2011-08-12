require ("Screen")
require ("SplashScreen")
require ("MenuScreen")
require ("GameScreen")
require ("Util")

ScreenManager = {screen = nil, screens = {}, _sm = nil}

function ScreenManager:new ()
	inst = {screen = nil, screens = {}}
	setmetatable(inst, self)
	self.__index = self
	return inst
end

function ScreenManager:init ()
	if self.screen == nil then
		return
	else
		self.screen:init()
	end
end

function ScreenManager:updateInput (event)
	if self.screen == nil then
		return
	else
		self.screen:updateInput(event)
	end
end

function ScreenManager:update ()
	if self.screen == nil then
		return
	else
		self.screen:update()
		self:nextScreen()
	end
end

function ScreenManager:draw ()
	if self.screen == nil then
		return
	else
		self.screen:draw()
	end
end

function ScreenManager:exit ()
	if self.screen == nil then
		return
	else
		self.screen:exit()
	end
end

function ScreenManager:setActiveScreen (activeScreen)
	if self.screen ~= nil then
		self.screen:exit()
	end
	self.screen = self.screens[activeScreen]
	self.screen:init()
end

function ScreenManager:getScreen ()
	if self.screen == nil then
		print("no screen attached to manager")
		return nil
	end
	return self.screen
end

function ScreenManager:addScreen (newScreen)
	self.screens[newScreen.name] = newScreen
end

function ScreenManager:nextScreen ()
	--print("transition " .. self.screen.name .. " " .. self.screen.state)
	if self.screen == nil then
		print("no screen attached to manager")
		return nil
	end
	--print(self.screen.state)
	--print(self.screen.name)
	if self.screen.state ~= self.screen.name then
		self:setActiveScreen (self.screen.state)
	end
end

function ScreenManager:printScreenNames ()
	print("     -- Screens --")
	for k, v in pairs(screens) do 
		print(string.format("     %s: %s", tostring(k), tostring(v)))
	end
end


function ScreenManager.getInstance ()
	if _sm ~= nil then
		return _sm
	else
		return nil
	end
end

function ScreenManager:setInstance(screenManager)
	_sm = screenManager
end

function ScreenManager:setupScreens()
	Util.functionDebug(Util.screenDebug, "----- [Begin] setupScreens -----")
	
	Util.functionDebug(true, "     Instantiating ScreenManager")	

	-- Instantiate needed screens
	ss = SplashScreen:new("splashScreen")
	ms = MenuScreen:new("menuScreen")
	gs = GameScreen:new("gameScreen")

	_sm:addScreen(ss)
	_sm:addScreen(ms)
	_sm:addScreen(gs)
	_sm:init()

	if screenDebug then
		_sm.printScreenNames()
	end

	-- Set Splash Screen as the first active screen
	_sm:setActiveScreen("splashScreen")

	Util.functionDebug(Util.screenDebug, "----- [End] setupScreens -----")
end
