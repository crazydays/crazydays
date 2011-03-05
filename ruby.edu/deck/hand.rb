require 'card.rb'

class Hand
	attr_accessor :cards

	def initialize()
		@cards = Array.new
	end

	def insert(card)
		@cards.push(card)
		@cards = @cards.sort_by { |a| [a.value, a.suit.to_s] }
	end

	def to_s
		value = ''
		@cards.length.times do |i|
			if i > 0 then
				value << ', '
			end
			value << @cards[i].to_s
		end

		value
	end
end
