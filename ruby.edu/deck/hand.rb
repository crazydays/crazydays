require 'card.db'

def Hand
	def initialize()
		@cards = Array.new
	end

	def insert(card)
		@cards.push(card)
	end
end
