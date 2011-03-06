require 'card.rb'

class Deck
	attr_accessor :cards

	def initialize()
		@cards = Array.new
		([Suit::SPADE, Suit::DIAMOND, Suit::CLUB, Suit::HEART]).each do |suit|
			(1..13).each { |i| @cards.push(Card.new(suit, i)) }
		end
	end

	def shuffle!
		@cards.shuffle!
	end

	def empty?
		@cards.empty?
	end

	def deal
		@cards.pop
	end

	def eql? (deck)
		@cards.eql? deck.cards
	end
end
