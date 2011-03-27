require 'card_count.rb'
require 'card_sort.rb'

module FourKind
	include CardCount

	def four_of_kind?
		assert_full_hand

		values = CardSort.by_value(@cards)
		four = CardSort.find_match(values, 4)

		four.last unless four == nil
	end
end
