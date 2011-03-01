require 'card.rb'

class Deck
	def initialize()
		@cards = Array.new
		(:spade, :diamond, :club, :heart).each {
			|suit|
			(1..13).each { |i| @cards.push(Card.new(suit, i)}
		}
		@cards.shuffle!
	end

	def empty
		@cards.length == 0
	end

	def deal
		@cards.pop
	end
end
