require 'card_count.rb'

module FullHouse
	include CardCount

	def full_house?
		assert_full_hand

		values = cards_by_value

		pair = find_best_pair(values)
		triplet = find_best_triplet(values)

		unless pair == nil || triplet == nil
			triplet[2]
		end
	end

	def cards_by_value
		values = Hash.new{|h, k| h[k] = []}

		@cards.each do |card|
			values[card.value] << card
		end

		values
	end

	def find_best_pair(cards)
		best = nil

		[(2..13).to_a, 1].flatten!.each do |i|
			unless cards[i] == nil
				if cards[i].size == 2
					best = cards[i]
				end
			end
		end

		best
	end

	def find_best_triplet(values)
		best = nil

		[(2..13).to_a, 1].flatten!.each do |i|
			if values[i] != nil && values[i].size == 3
				best = values[i]
			end
		end

		best
	end
end
