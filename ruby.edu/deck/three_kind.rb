require 'card_count.rb'
require 'card_sort.rb'

module ThreeKind
	include CardCount

	def three_of_kind?
		assert_full_hand

		values = CardSort.by_value(@cards)
		triplet = CardSort.find_match(values, 3)

		triplet[2] unless triplet == nil
	end
end
