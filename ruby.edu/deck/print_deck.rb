require 'deck.rb'
require 'card.rb'

deck = Deck.new
deck.shuffle!

while !deck.empty?
	puts deck.deal.to_s
end
