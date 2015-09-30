Card = Class()

function Card:constructor()
	ballpark = math.random(100)
	if ballpark < 40 then
		self.value = math.random(10)
	elseif ballpark >= 40 and ballpark < 75 then
		self.value = math.random(11, 99)
	elseif ballpark >= 75 and ballpark < 85 then
		self.value = math.random(100, 999)
	elseif ballpark >= 85 and ballpark < 95 then
		self.value = math.random(1000, 9999)
	elseif ballpark >= 95 and ballpark < 98 then
		self.value = math.random(-10, 0)
	elseif ballpark >= 98 and ballpark < 100 then
		self.value = math.random(-100, -11)
	elseif ballpark == 100 then
		self.value = math.random(10000, 1000000)
	end
	return self
end

function Card:playCard()
	
end