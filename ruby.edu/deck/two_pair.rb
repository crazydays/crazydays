require 'card_count.rb'

module TwoPair
	include CardCount

	def two_pair?
		assert_full_hand

		high = nil

		if @cards[0].value == 1 && @cards[1].value == 1
			(2..(@cards.size - 1)).each do |i|
				if @cards[i].value == @cards[i - 1].value
					high = @cards[1]
				end
			end
		else
			first = nil

			(1..(@cards.size - 1)).each do |i|
				if @cards[i].value == @cards[i - 1].value
					first = i + 1
					break
				end
			end

			unless first == nil
				(first..(cards.size - 1)).each do |i|
					if @cards[i].value == @cards[i - 1].value
						high = @cards[i]
					end
				end
			end
		end

		high
	end
end
