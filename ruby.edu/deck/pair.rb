require 'card_count.rb'
require 'card_sort.rb'

module Pair
	include CardCount

	def pair?
		assert_full_hand

		pair = nil
		values = CardSort.by_value(@cards)

		[(2..13).to_a, 1].flatten!.each do |i|
			if values[i].size == 2
				pair = values[i]
			end
		end

		pair[1] unless pair == nil
	end
end
