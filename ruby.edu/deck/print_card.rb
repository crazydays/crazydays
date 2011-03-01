require 'deck.rb'
require 'card.rb'

deck = Deck.new

while !deck.empty
	print deck.deal
end
