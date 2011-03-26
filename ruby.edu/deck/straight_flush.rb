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
		inorder = 0
		max = nil

		[(1..13).to_a, 1].flatten!.each do |i|
			if cards[i].size > 0
				inorder += 1
				max = cards[i].last unless inorder < 5
			else
				inorder = 0
			end
		end

		max
	end
end
