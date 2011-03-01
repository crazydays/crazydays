
class Card
	attr_accessor :suit, :value

	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def to_s
		value_to_s + ' of ' + suit_to_s + "\n"
	end

	def value_to_s
		case @value
		when 13
			"king"
		when 12
			"queen"
		when 11
			"jack"
		when 1
			"ace"
		else
			@value.to_s
		end
	end

	def suit_to_s
		case @suit
		when :spade
			"spades"
		when :heart
			"hearts"
		when :club
			"clubs"
		when :diamond
			"diamonds"
		else
			"error"
		end
	end
end
