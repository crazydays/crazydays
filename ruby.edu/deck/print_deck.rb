require 'deck'
require 'card'

deck = Deck.new
deck.shuffle!

while !deck.empty?
	puts deck.deal.to_s
end
