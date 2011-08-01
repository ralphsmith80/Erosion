Screen = {name = ""}

function Screen:new (name)
	inst = {name = name}
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
