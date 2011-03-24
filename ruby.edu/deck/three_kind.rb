require 'card_count.rb'
require 'card_sort.rb'

module ThreeKind
	include CardCount

	def three_of_kind?
		assert_full_hand

		high = nil
		values = CardSort.by_value(@cards)

		[(2..13).to_a, 1].flatten!.each do |i|
			if values[i].size == 3
				high = values[i]
			end
		end

		high[2] unless high == nil
	end
end
