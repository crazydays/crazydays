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
end
