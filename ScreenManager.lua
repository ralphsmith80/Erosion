require ("Screen")

ScreenManager = {screen = nil}

function ScreenManager:new (screen)
	inst = {screen = screen}
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

function ScreenManager:setScreen (screen)
	if self.screen ~= nil then
		self.screen:exit()
	end
	self.screen = screen
end

function ScreenManager:getScreen ()
	if self.screen == nil then
		print("no screen attached to manager")
		return nil
	end
	return self.screen
end
