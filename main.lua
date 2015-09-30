-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)

function removeByValue(t, v)
	for i,c in ipairs(t) do
		if c == v then
			table.remove(t, i)
			return
		end
	end
end

require "Class"
require "Card"
require "UI"
require "player"
math.randomseed( os.time() )

UI:dealCards()