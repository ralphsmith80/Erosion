
Circle = {x=0, y=0, r=0, lifeTime=0}

function Circle:new (x, y, r)
	inst = {x = x, y = y, r = r}
	setmetatable(inst, self)
	self.__index = self
	return inst
end

function Circle:addLifeTime (dt)
	self.lifeTime = self.lifeTime + dt
	
	-- Increase radius based on lifeTime
	self:grow(dt)
end

function Circle:grow (dt)
	self.r = self.r + dt
end

function Circle:difference (circle)
	x = math.abs (self.x - circle.x)
	y = math.abs (self.y - circle.y)
	r = math.abs (self.r - circle.r)
	print("diff " ..
		"x " .. x .. " y " .. y .. " r " .. r)
end

function Circle:show ()
	print("x " .. self.x .. " y " .. self.y .. " r " .. self.r)
end

--[[circle = Circle:new()
circle:show()
--circle:addLifeTime(10)
print(circle.lifeTime)
print(circle.r)
c2 = Circle:new(1, 2, 3)
circle:difference(c2)
--circle:grow(10)
--circle.show(circle)
--print(circle.x)
]]