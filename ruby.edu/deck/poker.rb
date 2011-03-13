require 'deck.rb'
require 'card.rb'
require 'hand.rb'

# create deck
deck = Deck.new
deck.shuffle!

# 5 players
hands = Array.new
(0..4).each { |i| hands[i] = Hand.new }

# deal
(0..4).each { (0..4).each { |i| hands[i].insert(deck.deal) } }

# display
(0..4).each do |i| 
	puts "hand " + i.to_s + ": " + hands[i].to_s
end

# determine winner
winner = hands[0]
(1..4).each { |i| winner = winner.score < hands[i].score ? hands[i] : winner }
puts "Winner! " + winner.to_s
