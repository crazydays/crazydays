require 'card_count.rb'

module ThreeKind
	include CardCount

	def three_of_kind?
		assert_full_hand

		high = nil

		(2..(@cards.size - 1)).each do |i|
			if @cards[i].value == @cards[i - 2].value
				high = @cards[i]
			end
		end

		high
	end
end
