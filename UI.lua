UI = {}
UI.cards = {}

function UI:displayCard(card, x, y)
	x = x or 0
	y = y or 0
	local function onTouchCard(event)
		local card = event.target
		local phase = event.phase
		if "began" == phase then
			card:setTextColor(1, 0, 0)
		elseif "ended" == phase then
			card:setTextColor(1, 1, 1)
			table.insert(player.numbers, card.cardObject.value)
			checkAllRules()
			self:clearCards()
			self:dealCards()
			-- for i, value in pairs(player.numbers) do
			-- 	print(value)
			-- end
		end
	end

	card.image = display.newText(card.value, x, y, native.systemFont, 36)
	card.image.cardObject = card
	card.image:addEventListener( "touch", onTouchCard )
end

function UI:displayFive(cards)
	local xOffset = 50
	local yOffset = 60
	self:displayCard(cards[1], xOffset, yOffset)
	self:displayCard(cards[2], display.viewableContentWidth - xOffset, yOffset)
	self:displayCard(cards[3], display.viewableContentWidth / 2, display.viewableContentHeight / 2)
	self:displayCard(cards[4], xOffset, display.viewableContentHeight - yOffset)
	self:displayCard(cards[5], display.viewableContentWidth - xOffset, display.viewableContentHeight - yOffset)
end

function UI:clearCards()
	for i, card in ipairs(self.cards) do
		card.image:removeSelf()
	end
	self.cards = {}
end

function UI:dealCards()
	self.cards = { Card.new(), Card.new(), Card.new(), Card.new(), Card.new() }
	self:displayFive(self.cards)
end

function ruleTwoOrMoreEvens()
	-- two or more even numbers
	if #player.numbers > 1 then
		evensCount = 0
		for i, value in pairs(player.numbers) do
			if value % 2 == 0 then
				evensCount = evensCount + 1
				print("even number found:", value)
				if evensCount >= 2 then
					print("matched 2 or more evens")
					return true
				end
			end
		end
	end
end

function checkAllRules()
	ruleTwoOrMoreEvens()
end