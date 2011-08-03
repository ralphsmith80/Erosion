Screen = {name = "", state = ""}

function Screen:new (name)
	inst = {name = name, state = name}
	setmetatable(inst, self)
	self.__index = self
	return inst
end

function Screen:init ()
	print("init base Screen class")
end

function Screen:updateInput (event)
	print("update input base Screen class")
end

function Screen:update ()
	print("update base Screen class")
end

function Screen:draw ()
	print("draw base Screen class")
end

function Screen:exit ()
	print("exit base Screen class")
end

function Screen:getName ()
	if self.name == "" then
		print("scene name is nil")
	end
	return self.name
end

-- This will be hold the state of the next screen to tansistion to.
-- If state == name then we stay on the same screen.
function Screen:getState ()
	return self.state
end

function Screen:setState (state)
	self.state = state
end
