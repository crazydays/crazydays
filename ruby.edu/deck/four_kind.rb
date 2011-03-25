require 'card_count.rb'
require 'card_sort.rb'

module FourKind
	include CardCount

	def four_of_kind?
		assert_full_hand

		four = nil
		values = CardSort.by_value(@cards)

		[(2..13).to_a, 1].flatten!.each do |i|
			if values[i].size == 4
				four = values[i]
			end
		end

		four.last unless four == nil
	end
end
