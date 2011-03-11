require 'card.rb'

class Hand
	attr_accessor :cards, :size

	def initialize(size = 5)
		@cards = Array.new
		@size = size
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

	def straight_flush?
		straight? && flush?
	end

	def four_of_kind?
		@cards[0].value == @cards[3].value ||
		@cards[1].value == @cards[4].value
	end

	def full_house?
		(@cards[0].value == @cards[2].value &&
		 @cards[3].value == @cards[4].value) ||
		(@cards[0].value == @cards[1].value &&
		 @cards[2].value == @cards[4].value)
	end

	def flush?
		@cards[0].suit == @cards[1].suit &&
		@cards[2].suit == @cards[3].suit &&
		@cards[1].suit == @cards[4].suit &&
		@cards[3].suit == @cards[4].suit
	end

	def straight?
		if @cards[0].value == 1 && @cards[4].value == 13
		then
			@cards[1].value == 10 &&
			@cards[2].value == 11 &&
			@cards[3].value == 12
		else
			(@cards[0].value + 1) == @cards[1].value &&
			(@cards[0].value + 2) == @cards[2].value &&
			(@cards[0].value + 3) == @cards[3].value &&
			(@cards[0].value + 4) == @cards[4].value
		end
	end

	def three_of_kind?
		@cards[0].value == @cards[2].value ||
		@cards[1].value == @cards[3].value ||
		@cards[2].value == @cards[4].value
	end

	def two_pair?
		if @cards[0].value == @cards[1].value
		then
			cards[2].value == @cards[3].value ||
			cards[3].value == @cards[4].value
		else
			@cards[1].value == @cards[2].value &&
			@cards[3].value == @cards[4].value
		end
	end

	def pair?
		@cards[0].value == @cards[1].value ||
		@cards[1].value == @cards[2].value ||
		@cards[2].value == @cards[3].value ||
		@cards[3].value == @cards[4].value
	end
end
