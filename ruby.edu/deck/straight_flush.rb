require 'card_count.rb'
require 'card_sort.rb'

module StraightFlush
	include CardCount

	def straight_flush?
		assert_full_hand

		straight = nil
		suits = CardSort.by_suit(@cards)

		suits.values.each do |suit|
			values = CardSort.by_value(suit)
			current = check_straight(values)

			if straight == nil && current != nil
				straight = current
			elsif straight != nil && current != nil
				straight = straight.value > current.value ? straight : current
			end
		end

		straight
	end

	def check_straight(cards)
		run = CardSort.find_run(cards)
		run.last unless run == nil
	end
end
