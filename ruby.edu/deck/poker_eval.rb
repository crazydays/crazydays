require 'hand.rb'
require 'pair.rb'

class PokerEvaluator
  include Pair

  attr_accessor :hand

  def initialize(hand)
    @hand = hand
  end

  def score
    
  end

  def high_card()
    sorted = CardSort.by_value(@hand.cards)

    cards = Array.new

    [(2..13).to_a, 1].flatten!.reverse!.each do |i|
      cards << sorted[i]
      cards.flatten!
      break if cards.size == 5
    end
    
    cards
  end
end
