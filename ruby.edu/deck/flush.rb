require 'suit.rb'
require 'card_count.rb'
require 'card_sort.rb'

module Flush
	include CardCount

	def flush?
		assert_full_hand

		flush = nil
		suits = CardSort.by_suit(@cards)

		suits.values.each do |cards|
			if cards.size >= 5
				flush = cards
			end
		end

		flush[0].value == 1 ? flush[0] : flush.last unless flush == nil
	end
end
