require ("Screen")

ScreenManager = {screen = nil, screens = {}}

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
