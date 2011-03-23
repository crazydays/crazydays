require 'card_count.rb'

module Pair
	include CardCount

	def pair?
		assert_full_hand

		if @cards[0].value == 1 && @cards[0].value == @cards[1].value
			@cards[1]
		else
			high = nil
			(1..(@cards.size - 1)).each do |i|
				if @cards[i].value == @cards[i - 1].value
					high = @cards[i]
				end
			end

			high
		end
	end
end
