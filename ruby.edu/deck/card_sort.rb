require 'card.rb'

module CardSort
	def CardSort.by_suit(cards)
		suits = Hash.new{|h, k| h[k] = []}
		cards.each {|c| suits[c.suit] << c }
		suits
	end

	def CardSort.by_value(cards)
		values = Hash.new{|h, k| h[k] = []}
		cards.each {|c| values[c.value] << c }
		values
	end

	def CardSort.find_run(cards, size = 5)
		best = nil
		current = Array.new

		[(1..13).to_a, 1].flatten!.each do |i|
			if cards[i].size > 0
				current << cards[i].last
			else
				best = current unless current.size < size
				current = Array.new
			end
		end

		best
	end
end
