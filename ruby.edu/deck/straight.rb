require 'card_count.rb'

module Straight
	include CardCount

	def straight?
		assert_full_hand

		high = nil
		(4..(@cards.size - 1)).each do |i|
			if @cards[i].value - 1 == @cards[i - 1].value &&
			   @cards[i].value - 2 == @cards[i - 2].value &&
			   @cards[i].value - 3 == @cards[i - 3].value &&
			   @cards[i].value - 4 == @cards[i - 4].value
				high = @cards[i]
			end
		end

		if @cards[0].value == 1 &&
		   @cards[@cards.size - 1].value == 13 &&
		   @cards[@cards.size - 2].value == 12 &&
		   @cards[@cards.size - 3].value == 11 &&
		   @cards[@cards.size - 4].value == 10
			high = @cards[0]
		end

		high
	end
end
