require 'card_count.rb'
require 'card_sort.rb'

module Straight
	include CardCount

	def straight?
		assert_full_hand

		values = CardSort.by_value(@cards)
		run = CardSort.find_run(values)
		run.last unless run == nil
	end
end
