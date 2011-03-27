require 'card_count.rb'
require 'card_sort.rb'

module Pair
	include CardCount

	def pair?
		assert_full_hand

		values = CardSort.by_value(@cards)
		pair = CardSort.find_match(values, 2)

		pair[1] unless pair == nil
	end
end
