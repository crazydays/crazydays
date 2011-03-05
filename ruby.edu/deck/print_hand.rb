require 'deck.rb'
require 'hand.rb'
require 'card.rb'

deck = Deck.new
deck.shuffle!

hand1 = Hand.new
hand2 = Hand.new

hand1.insert(deck.deal)
hand2.insert(deck.deal)
hand1.insert(deck.deal)
hand2.insert(deck.deal)
hand1.insert(deck.deal)
hand2.insert(deck.deal)
hand1.insert(deck.deal)
hand2.insert(deck.deal)
hand1.insert(deck.deal)
hand2.insert(deck.deal)

puts hand1.to_s
puts hand2.to_s
