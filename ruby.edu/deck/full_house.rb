require 'card_count.rb'
require 'card_sort.rb'

module FullHouse
	include CardCount

	def full_house?
		assert_full_hand


		triplet = nil
		pair = nil
		values = CardSort.by_value(@cards)

		[(2..13).to_a, 1].flatten!.reverse!.each do |i|
			if triplet == nil && values[i].size == 3
				triplet = values[i]
			elsif pair == nil && values[i].size >= 2
				pair = values[i]
			end
		end

		triplet.last unless triplet == nil || pair == nil
	end
end
