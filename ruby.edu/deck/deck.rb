require 'card.rb'

class Deck
	def initialize()
		@cards = Array.new
		([:spade, :diamond, :club, :heart]).each do |suit|
			(1..13).each { |i| @cards.push(Card.new(suit, i)) }
		end
		@cards.shuffle!
	end

	def empty?
		@cards.empty?
	end

	def deal
		@cards.pop
	end
end
