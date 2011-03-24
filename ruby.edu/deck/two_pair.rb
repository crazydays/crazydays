require 'card_count.rb'
require 'card_sort.rb'

module TwoPair
	include CardCount

	def two_pair?
		assert_full_hand

		high = nil
		low = nil
		values = CardSort.by_value(@cards)

		[(2..13).to_a, 1].flatten!.reverse!.each do |i|
			if values[i].size == 2
				if high == nil
					high = values[i]
				elsif low == nil
					low = values[i]
				end
			end
		end

		high[1] unless low == nil
	end
end
